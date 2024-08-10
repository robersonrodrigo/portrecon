![image](https://github.com/user-attachments/assets/cc7b4a91-4959-42f8-9f88-c0be2c2e0617)

PortRecon é um script de shell desenvolvido para realizar varreduras de portas e serviços em redes. Com uma interface de linha de comando simples, ele permite que os usuários realizem uma variedade de operações de rede, como varredura de portas usando diferentes ferramentas e técnicas.

## Funcionalidades

O script oferece as seguintes opções:

- **-a**: PortScan com Hping3
- **-b**: Ping Sweep
- **-c**: Ping Sweep Porta/Serviço
- **-d**: PortScan em /dev/tcp
- **-e**: PortScan com NetCat
- **-f**: Chamar Script Externo
- **-g**: Extração de Dados
- **-h**: Localizando Serviços
- **-i**: Identifica Métodos
- **-j**: Localizando Servidores Web

## Requisitos

- `hping3`: Para realizar varreduras de portas.
- `netcat`: Para comunicação de rede.
- `nmap`: Para identificação de serviços.

## Instalação

1. Clone o repositório:
   
   ```bash
   git clone https://github.com/robersonrodrigo/portrecon.git
   cd portrecon
   
3. Dê permissão de execução ao script:

   ```bash
   chmod +x portrecon.sh

## Uso
  Execute o script com uma das opções disponíveis. Por exemplo:
  
    ./portrecon.sh -a
    
## Contribuição
Contribuições são bem-vindas! Se você deseja contribuir, por favor, faça um fork do repositório e envie um pull request.

## Creditos

      Desenvolvedor Principal: ZeD 

      Roberson Rodrigo | https://www.linkedin.com/in/robersonr

Contribuições Especiais: Carlos Tuma - https://github.com/carlosalbertotuma | https://www.linkedin.com/in/carlos-tuma

0ff3ns!v3 S3cur!ty ®
