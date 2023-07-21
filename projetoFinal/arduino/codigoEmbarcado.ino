/*
   
   Fabrício Sousa
   Exemplo IBM Watson IoT Platform + Planta IoT
   Hardware: new NodeMCU LoLin V3 + Sensor umidade solo


   Logica:
   1. efetua conexao com a rede WiFi
   2. obtem a grandeza de umidade do solo
   3. conecta no servidor MQTT IBM Watson IoT Platform
   4. publica a JSON string para o topico 
   
   referencias Bluemix e IoTF:
   Autor: FilipeFlop
   https://www.filipeflop.com/blog/planta-iot-com-esp8266-nodemcu/
   
*/


#include <ESP8266WiFi.h>
#include <PubSubClient.h>


//atualize SSID e senha WiFi
const char* ssid = "CLARO_2GD1F9EE";
const char* password = "12345678";


//D4 only for Lolin board
#define LED_BUILTIN D4



//Atualize os valores de Org, device type, device id e token
#define ORG "5mhplu"
#define DEVICE_TYPE "Bafometro"
#define DEVICE_ID "bafometro"
#define TOKEN "123456789"


//broker messagesight server
char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
char topic[] = "iot-2/evt/status/fmt/json";
char authMethod[] = "use-token-auth";
char token[] = TOKEN;
char clientId[] = "d:" ORG ":" DEVICE_TYPE ":" DEVICE_ID;


WiFiClient wifiClient;
PubSubClient client(server, 1883, NULL, wifiClient);


void setup() {
  Serial.begin(115200);
  Serial.println();
  Serial.println("Iniciando...");


  Serial.print("Conectando na rede WiFi "); Serial.print(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("[INFO] Conectado WiFi IP: ");
  Serial.println(WiFi.localIP());


  pinMode(LED_BUILTIN, OUTPUT);
}



void loop() {

  float FazLeituraUmidade() {
    float valor_analogico = analogRead(A0);
    if (isnan(valor_analogico)) {
      Serial.println("Failed to read from MQ-3 sensor!");
      return 0.0; // Retorne um valor válido ou trate o erro adequadamente
    }
    return valor_analogico;
  }
  if (!!!client.connected()) {


    float umidade = FazLeituraUmidade() / 1023.0 * (sensibilidadeMaxima - sensibilidadeMinima) + sensibilidadeMinima;
    char umidadestr[8];
    dtostrf(umidade, 3, 2, umidadestr);

    String payload = "{\"d\":{\"umidade\":\"" + String(umidadestr) + "\"}}";

    Serial.print("Reconnecting client to ");
    Serial.println(server);
    while (!!!client.connect(clientId, authMethod, token)) {
      Serial.print(".");
      delay(500);
    }
    Serial.println();
  }

  if (isnan(valor_analogico))
  {
  Serial.println("Failed to read from MQ-3 sensor!");
  return;
  }

  delay(500);

  Serial.println("Timing...");
  
  // Conversao Floats para Strings
  char TempString[32];  //  array de character temporario



  // Prepara JSON para IOT Platform
  int length = 0;


  String payload = "{\"d\":{\"VALOR\":\"" + String(valor_analogico/1023*100) + "\"}}";


  length = payload.length();
  Serial.print(F("\nData length"));
  Serial.println(length);


  Serial.print("Sending payload: ");
  Serial.println(payload);


  if (client.publish(topic, (char*) payload.c_str())) {
    Serial.println("Publish ok");
    digitalWrite(LED_BUILTIN, LOW);
    delay(500);
    digitalWrite(LED_BUILTIN, HIGH);
    delay(500);
  } else {
    Serial.println("Publish failed");
    Serial.println(client.state());
  }
}
