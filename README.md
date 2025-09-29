# FastLocation 📍

Aplicação Flutter para consulta de CEP e endereços utilizando a API do ViaCEP.

## 📱 Sobre o Projeto

FastLocation é um aplicativo que permite:
- ✅ Consultar endereços por CEP
- ✅ Histórico de consultas
- ✅ Interface moderna e intuitiva
- ✅ Suporte para Web, Android, iOS e macOS

## 🚀 Como Rodar o Projeto

### Pré-requisitos

- Flutter SDK (versão 3.0 ou superior)
- Dart SDK
- Android Studio (para Android)
- Xcode (para iOS - apenas macOS)

### Verificar Instalação

```bash
flutter doctor
```

### 1. Clone o Repositório

```bash
git clone https://github.com/gabschlemper/fast-location.git
cd fast-location/fast_location
```

### 2. Instalar Dependências

```bash
flutter pub get
```

### 3. Gerar Código (MobX e Hive)

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 4. Executar o Aplicativo

#### 🌐 Web (Chrome)
```bash
flutter run -d chrome
```

#### 🖥️ macOS Desktop
```bash
flutter run -d macos
```

#### 📱 Android
```bash
# Conecte um dispositivo Android ou inicie um emulador
flutter run
```

#### 🍎 iOS
```bash
# Conecte um dispositivo iOS ou inicie o simulador
flutter run
```

#### Ver Dispositivos Disponíveis
```bash
flutter devices
```

#### Listar Emuladores
```bash
flutter emulators
```

#### Iniciar Emulador Android
```bash
flutter emulators --launch <emulator_id>
```

## 🛠️ Tecnologias Utilizadas

- **Flutter** - Framework principal
- **Dio** - Cliente HTTP para API calls
- **MobX** - Gerenciamento de estado
- **Hive** - Armazenamento local
- **ViaCEP API** - Consulta de endereços

## 📂 Estrutura do Projeto

```
lib/
├── src/
│   ├── http/           # Configuração HTTP (Dio)
│   ├── modules/        # Módulos da aplicação
│   │   ├── home/       # Tela principal
│   │   ├── history/    # Histórico de consultas
│   │   └── initial/    # Splash screen
│   ├── routes/         # Rotas da aplicação
│   └── shared/         # Recursos compartilhados
│       ├── colors/     # Cores do tema
│       ├── metrics/    # Métricas e dimensões
│       └── storage/    # Configuração do Hive
└── main.dart           # Ponto de entrada
```

## 🔧 Solução de Problemas

### Erro de Imports
Se houver erros de imports, execute:
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Problemas com Android
```bash
flutter doctor --android-licenses
```

### Problemas com iOS
```bash
# Instalar CocoaPods
brew install cocoapods
```

## 📝 Como Usar

1. Digite um CEP no campo de busca
2. Toque em "Buscar" ou pressione Enter
3. Visualize o endereço completo
4. Acesse o histórico para ver consultas anteriores
5. Toque em um endereço do histórico para abrir no mapa

## 🤝 Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
