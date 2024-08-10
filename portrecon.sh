#!/bin/bash

# Define cores para formatação
cor_vermelho="\e[1;31m"   # Define vermelho claro e negrito
cor_verde="\e[1;32m"      # Define verde claro e negrito
cor_azul="\e[1;34m"       # Define azul
cor_reset="\e[0m"         # Reseta a formatação para o padrão

# Exibir o banner
banner() {
    echo ""
    echo -e "\033[31m"
    echo -e "  ____            _   ____                              "
    echo -e " |  _ \ ___  _ __| |_|  _ \ ___  ___ ___  _ __          "
    echo -e " | |_) / _ \| '__| __| |_) / _ \/ __/ _ \| '_ \         "
    echo -e " |  __/ (_) | |  | |_|  _ <  __/ (_| (_) | | | |        "
    echo -e " |_|   \___/|_|   \__|_| \_\___|\___\___/|_| |_| v1.0.3 "
    echo  ""
    echo -e "                  Developed by ZeD"
    echo -e "\033[0m"
    echo ""
}

# Função para exibir ajuda
exibir_ajuda() {
    echo -e "${cor_azul}Uso: ./portrecon.sh [opção]${cor_reset}"
    echo ""
    echo -e "${cor_verde}Opções disponíveis:${cor_reset}"
    echo ""
    echo -e "  -a\tPortScan com Hping3"
    echo -e "  -b\tPingSweep"
    echo -e "  -c\tPingSweep Porta/Serviço"
    echo -e "  -d\tPortScan em /dev/tcp"
    echo -e "  -e\tPortScan com NetCat"
    echo -e "  -f\tChamar Script Externo"
    echo -e "  -g\tExtração de Dados"
    echo -e "  -h\tLocalizando Serviços"
    echo -e "  -i\tIdentifica Metodos"
    echo -e "  -j\tLocalizador de Servidores Web"
#    echo -e "  -k\tOpcao K"
#    echo -e "  -l\tOpcao L"
#    echo -e "  -m\tOpcao M"
#    echo -e "  -n\tOpcao N"
#    echo -e "  -o\tOpcao O"
#    echo -e "  -p\tOpcao P"
#    echo -e "  -q\tOpcao Q"
#    echo -e "  -r\tOpcao R"
#    echo -e "  -s\tOpcao S"
#    echo -e "  -t\tOpcao T"
#    echo -e "  -u\tOpcao U"
#    echo -e "  -v\tOpcao V"
#    echo -e "  -x\tOpcao X"
#    echo -e "  -z\tOpcao Z"
    echo ""
}

# Função para validar a entrada do IP
validar_ip() {
    local ip=$1
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        return 0
    else
        echo -e " ${cor_vermelho}IP inválido. Por favor, digite um IP válido.${cor_reset}"
        exit 1
    fi
}

# Lógica do script
if [[ "$1" == "--help" ]]; then
    banner
    exibir_ajuda
    exit 0
fi

if [ "$1" = "-a" ]; then
    banner
    echo -e "${cor_azul}**PortScan com Hping3**${cor_reset}"
    echo ""
    read -p "Digite o IP: " ip
    validar_ip "$ip"
    read -p "Digite a Porta Inicial : " portai
    read -p "Digite a porta Final: " portaf
    sudo hping3 "$ip" -S --scan "$portai"-"$portaf"

elif [ "$1" = "-b" ]; then
    banner
    echo -e "${cor_azul}**Ping Sweep**${cor_reset}"
    echo ""
    read -p "Digite o IP da Rede (ex: 10.0.0):  " ip
    validar_ip "$ip.1"
    echo ""
    for i in $(seq 1 254); do
         if [ -n "$(sudo timeout 0.1 hping3 -1 -c 1 "$ip.$i" 2>/dev/null | grep 'ttl')" ]; then
            echo -e "${cor_verde}$ip.$i"
        fi
    done

elif [ "$1" = "-c" ]; then
    banner
    echo -e "${cor_azul}**Ping Sweep Porta/Servico**${cor_reset}"
    echo ""
    read -p "Digite o IP da Rede '(ex: 10.0.0)': " ip
    validar_ip "$ip.1"
    read -p "Digite a Porta: " port
    for i in $(seq 1 254); do
        if [ -n "$(sudo timeout 0.1 hping3 -p "$port" -S -c 1 "$ip.$i" 2>/dev/null | grep 'flags=SA')" ]; then
            echo -e "$ip.$i"
        fi
    done

elif [ "$1" = "-d" ]; then
    banner
    echo -e "${cor_azul}**PortScan no /dev/tcp**${cor_reset}"
    echo ""
    read -p "Digite o IP: " ip
    validar_ip "$ip"
    for i in $(seq 1 65000); do
        timeout 0.5 bash -c "echo > /dev/tcp/$ip/$i" 2>/dev/null && echo -e "$i ${cor_verde}OPEN${cor_reset}"
    done

elif [ "$1" = "-e" ]; then
    banner
    sleep 2
    clear
    echo -e "${cor_azul}**PortScan com NetCat**${cor_reset}"
    echo ""
    echo -e "\033[31m"
    echo -e "              MMMMMM            MMMMMM               "
    echo -e "            MMMMMMMM            MMMMMMMM             "
    echo -e "          MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM           "
    echo -e "          MMMM  MMMMMMMMMMMMMMMMMMMM  MMMM           "
    echo -e "        MMMMMM  MMMMMM      ..MMMMMM  MMMMMM         "
    echo -e "        MMMM    MM                MM    MMMM         "
    echo -e "        MMMM                            MMMM         "
    echo -e "      MMMMMM                            MMMM++       "
    echo -e "      MMMMMM                            MMMMMM       "
    echo -e "      MMMMMM                            MMMM         "
    echo -e "        MMMM                            MMMM         "
    echo -e "        MMMMMM                        MMMMmm         "
    echo -e "          MMMMMM                    MMMMMM           "
    echo -e "          mmMMMMMM                MMMMMM--           "
    echo -e "              MMMMMMMMMMMMMMMMMMMMMMMM               "
    echo -e "                MMMMMMMMMMMMMMMMMMMM                 "
    echo -e "                      --MMMM                         "
    echo -e "$cor_reset"
    echo ""
    read -p "Digite o IP: " ip
    validar_ip "$ip"
    echo ""
    read -p "Digite a Porta Inicial: " portai
    read -p "Digite a Porta Final: " portaf
    echo ""
    nc -w 1 -v -n -z "$ip" "$portai"-"$portaf"

elif [ "$1" = "-f" ]; then
    banner
    echo -e "Chamar Script Externo"
    read -p "Digite o caminho para o script: " caminho
    bash "$caminho"

elif [ "$1" = "-g" ]; then
    banner
    echo -e "${cor_azul}**Dados Extract**${cor_reset}"
    ip addr show | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}'
    echo ""
    echo -n -e "${cor_verde}Digite Uma Porta: ${cor_reset}" 
    read port
    trap "echo 'Stopping...'; exit" SIGINT SIGTERM

	while true; do
        echo "Listening on port $port..."
        nc -l -p $port | tee -a extract.txt
        done

elif [ "$1" = "-h" ];then
    banner
    echo -e "${cor_azul}**Localizando Serviços**${cor_reset}"
    echo ""
    echo -n -e "${cor_verde}Digite o IP Alvo: ${cor_reset}"
    read ip
    nmap -sV -T5 -v -p- $ip | grep -i "OPEN"

elif [ "$1" = "-i" ]; then
    banner
    echo -e "${cor_azul}**Identifica Metodos**${cor_reset}"
    echo ""
    echo -n -e "${cor_verde}Digite o Dominios: ${cor_reset}"
    read dominio
    echo -n -e "${cor_verde}Digite a Porta: ${cor_reset}"
    read port
    echo -n -e "${cor_verde}Digite o endpoint (ex: /../pasta/...) ${cor_reset}"
    read endpoint
    echo -e ""
    echo -e "OPTIONS $endpoint / HTTP/1.1\r\nHost: 127.0.0.1\r\n\r\n" | nc -w 1 $dominio $port
        
elif [ "$1" = "-j" ]; then
     banner
    echo -e "${cor_azul}**Localizando Servidores Web**${cor_reset}"
    echo ""
    echo -n -e "${cor_verde}Digite a rede (ex: 10.0.0): ${cor_reset}"
    read rede 
    echo -n -e "${cor_verde}Digite o intervalo (ex: 1 a 254): ${cor_reset}"
    read intervaloi
    echo -n -e "${cor_verde}Digite o intervalo final (ex: 1 a 254): ${cor_reset}"
    read intervalof
    echo -n -e "${cor_verde}Digite a quantidade de Processos (ex: 1 a 100): ${cor_reset}"
    read process
    for i in $(seq "$intervaloi" "$intervalof"); do 
           echo -e "80\n443\n8080" | xargs -P "$process" -I {} bash -c "curl -s -I $rede\.$i:{} && echo 'Porta: {} $rede.$i'"
        done

elif [ "$1" = "-k" ]; then
    banner
    echo -e "Opcao K"

elif [ "$1" = "-l" ]; then
    banner
    echo -e "Opcao L"

elif [ "$1" = "-m" ]; then
    banner
    echo -e "Opcao M"

elif [ "$1" = "-n" ]; then
    banner
    echo -e "Opcao N"

elif [ "$1" = "-o" ]; then
    banner
    echo -e "Opcao O"

elif [ "$1" = "-p" ]; then
    banner
    echo -e "Opcao P"

elif [ "$1" = "-q" ]; then
    banner
    echo -e "Opcao Q"

elif [ "$1" = "-r" ]; then
    banner
    echo -e "Opcao R"

elif [ "$1" = "-s" ]; then
    banner
    echo -e "Opcao S"

elif [ "$1" = "-t" ]; then
    banner
    echo -e "Opcao T"

elif [ "$1" = "-u" ]; then
    banner
    echo -e "Opcao U"

elif [ "$1" = "-v" ]; then
    banner
    echo -e "Opcao V"

elif [ "$1" = "-x" ]; then
    banner
    echo -e "Opcao X"

elif [ "$1" = "-z" ]; then
    banner
    echo -e "Opcao Z"

# Se a opção for inválida
else
    banner
    echo ""
    exibir_ajuda
    exit 1
fi
