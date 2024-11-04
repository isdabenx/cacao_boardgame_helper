# Cacao Boardgame Helper (+Expansions)

## Descripció

Cacao Boardgame Helper és una aplicació mòbil desenvolupada amb Flutter dissenyada per ajudar als jugadors del joc de taula Cacao i les seves expansions. L'objectiu és proporcionar eines digitals que millorin l'experiència de joc, facilitant el seguiment de puntuacions, consulta de regles i gestió de partides.

## Estat del Projecte

🚧 **En Desenvolupament** 🚧

## Característiques

### 🏠 Menú Principal

- Accés ràpid a totes les funcionalitats, incloent configuració de partida, manuals, configuració general i selecció d'idioma.

### 📖 Manuals Integrats

- Accedeix als manuals del joc base i de totes les expansions disponibles, amb una versió optimitzada per a la lectura en dispositius mòbils.
- Opció de descarregar manuals oficials en PDF per a consulta fora de línia.

### 🎲 Configuració de Partida

- Selecciona el nombre de jugadors, assigna'ls un color i un nom personalitzats.
- Tria expansions i mòduls per a cada partida de manera fàcil, amb opcions de selecció aleatòria per variar l'experiència.
- Configura les llosetes segons el nombre de jugadors i les expansions seleccionades.

### 🕒 Temporitzador de Torn

- Activa un temporitzador per controlar la duració de cada torn, amb avisos sonors opcionalment configurables per avisar del temps restant.

### 📊 Assistència durant la Partida

- Consulta ràpida de regles i detalls de les llosetes, amb una descripció completa de cada lloseta segons el seu efecte i puntuació.
- Temporitzador per gestionar fàcilment els torns i mantenir la partida dinàmica.

### 🏆 Càlcul de Puntuació Final

- Calculadora automàtica de puntuacions per a cada jugador, incloent punts per cada component del joc base i de les expansions (or, temples, fitxes de Sol, màscares de mines, etc.).
- Determinació automàtica del guanyador, amb una opció per consultar un resum detallat de la puntuació de cada jugador.

### ⚙️ Configuració Personalitzable

- Personalitza l'experiència de joc amb opcions de so, vibració, selecció d'idioma i configuracions visuals.
- Selecciona quines expansions tens disponibles per desactivar-les fàcilment en la configuració de partida.

### 🌐 Suport Multiidioma

- Interfície d'usuari disponible en diversos idiomes (català, espanyol, anglès, i més en futures actualitzacions).

### 🗂 Base de Dades de Llosetes

- Accedeix a una base de dades completa de les llosetes del joc base i les expansions, amb filtres per facilitar la cerca.

### 🚀 Futures Actualitzacions (Planned Features)

- Suport per a noves expansions i plataformes addicionals (iOS, escriptori).
- Historial de partides per reviure cada sessió de joc.
- Possibilitat de guardar configuracions personalitzades de partida i de sincronitzar partides amb BoardGameGeek (BGG).

## Prerequisits

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

## Instal·lació

### Clonar el repositori

```bash
git clone https://github.com/isdabenx/cacao_boardgame_helper.git
cd cacao_boardgame_helper
```

### Instal·lar dependències

```bash
flutter pub get
```

### Executar l'aplicació

```bash
flutter run
```

## Configuració dels Git Hooks

Els Git Hooks són scripts que s'executen automàticament en determinats moments del cicle de Git (com abans d'un commit o push). La seva configuració ens ajuda a:

- Mantenir la qualitat del codi
- Executar tests automàticament
- Verificar el format del codi
- Prevenir commits amb errors

```bash
pub global activate git_hooks
git_hooks create git_hooks.dart
```

## Estructura del projecte

### Esquema de directoris

``` ascii
project_name
└─ lib
   ├─ config                    # Configuració general del projecte
   │  ├─ constants              # Constants globals com rutes o actius
   │  │  └─ assets.dart
   │  ├─ routes                 # Definició de rutes de navegació
   │  │  └─ app_routes.dart
   │  └─ localization           # Fitxers de traducció i internacionalització
   │     ├─ en.json
   │     ├─ es.json
   │     └─ other_language.json
   │
   ├─ core                      # Components globals i reutilitzables
   │  ├─ theme                  # Configuració del tema visual
   │  │  ├─ app_colors.dart
   │  │  ├─ app_fonts.dart
   │  │  └─ app_text_styles.dart
   │  ├─ utils                  # Funcions i utilitats generals
   │  │  └─ validators.dart
   │  ├─ error                  # Classes per a la gestió d'errors
   │  │  ├─ exceptions.dart
   │  │  └─ failure.dart
   │  ├─ services               # Serveis globals compartits
   │  │  ├─ network_service.dart
   │  │  ├─ auth_service.dart
   │  │  └─ notification_service.dart
   │  └─ integrations           # Configuració de plugins i serveis de tercers
   │     ├─ firebase_options.dart
   │     └─ analytics_service.dart
   │
   ├─ features                  # Funcionalitats de l'aplicació
   │  └─ feature_name           # Exemple d'una feature
   │     ├─ data                # Capa de dades de la feature
   │     │  ├─ models           # Models de dades per transferència
   │     │  │  └─ example_dto.dart
   │     │  ├─ repositories     # Implementacions de repositoris
   │     │  │  └─ example_repository_impl.dart
   │     │  └─ data_sources     # Fonts de dades (API, local, etc.)
   │     │     └─ example_api_data_source.dart
   │     ├─ domain              # Capa de domini (negoci) de la feature
   │     │  ├─ entities         # Entitats de domini
   │     │  │  └─ example_entity.dart
   │     │  ├─ repositories     # Interfícies dels repositoris
   │     │  │  └─ example_repository.dart
   │     │  └─ use_cases        # Casos d'ús de la feature
   │     │     └─ get_example_use_case.dart
   │     ├─ presentation        # Capa de presentació de la feature
   │     │  ├─ providers        # Gestió d'estat per la UI
   │     │  │  └─ example_provider.dart
   │     │  ├─ screens          # Pantalles principals
   │     │  │  └─ example_screen.dart
   │     │  └─ widgets          # Widgets i components específics de la UI
   │     │     └─ example_widget.dart
   │     └─ tests               # Tests modulars per la feature
   │        ├─ example_use_case_test.dart
   │        └─ example_screen_test.dart
   │
   ├─ shared                    # Components compartits i reutilitzables
   │  └─ widgets                # Widgets compartits a tota l'aplicació
   │     └─ menu_widget.dart
   │
   └─ main.dart                 # Punt d'entrada de l'aplicació

```

### Configuració General

- `config/`: Conté la configuració global de l’aplicació.
  - `constants/`: Manté constants globals, com ara rutes d'actius (imatges, fonts) i configuracions específiques de l’aplicació.
    - `assets.dart`: Defineix rutes per a imatges i altres fitxers que es fan servir a tota l’aplicació, facilitant l’actualització centralitzada.
  - `routes/`: Defineix les rutes de navegació per a l'aplicació.
    - `app_routes.dar`t: Conté la definició i gestió de les rutes de navegació entre pantalles, mantenint la lògica de navegació en un sol lloc.
  - `localization/`: Guarda els fitxers de traducció per suport multilingüe.
    - `en.json`, `es.json`, ...: Fitxers de traducció per a diferents idiomes. Permeten personalitzar l'idioma de l’aplicació de manera dinàmica.

### Components Globals i Reutilitzables

- `core/`: Emmagatzema components globals que es comparteixen entre diverses features.
  - `theme/`: Configuració de l'aparença visual (tema) de l'aplicació.
    - `app_colors.dart`: Defineix els colors globals del projecte.
    - `app_fonts.dart`: Gestiona les fonts utilitzades.
    - `app_text_styles.dart`: Centralitza els estils de text per mantenir una estètica uniforme.
  - `utils/`: Funcions i utilitats generals que poden ser reutilitzades en múltiples parts de l’aplicació.
    - `validators.dart`: Pot incloure validacions comunes (com correu electrònic, telèfon, etc.).
  - `error/`: Gestiona la captura i maneig d’errors globals.
    - `exceptions.dart`: Defineix excepcions personalitzades per a l'aplicació.
    - `failure.dart`: Classe per encapsular errors a mostrar a la UI.
  - `services/`: Serveis globals, com connexions de xarxa o autenticació, que poden ser compartits entre features.
    - `network_service.dart`: Proporciona mètodes per comprovar la connexió a internet.
    - `auth_service.dart`: Gestiona les funcions d’autenticació.
    - `notification_service.dart`: Per gestionar notificacions push o locals.
  - `integrations/`: Configuracions i serveis per a integracions de tercers (Firebase, Analytics).
    - `firebase_options.dart`: Configuració de Firebase.
    - `analytics_service.dart`: Classe per enviar esdeveniments d'Analytics.

### Funcionalitats de l'Aplicació (Features)

- `features/`: Aquest directori conté cada funcionalitat principal de l’aplicació. Cada feature s'organitza amb una estructura pròpia seguint Clean Architecture.
  - `feature_name/`: Exemple de directori per a una feature específica (com home o profile).
    - `data/`: Capa de dades per a la feature.
      - `models/`: Conté els models de dades o DTOs que es comuniquen amb fonts de dades externes.
      - `repositories/`: Implementacions dels repositoris que encapsulen la lògica d’accés a dades.
      - `data_sources/`: Fonts de dades concretes, com APIs o bases de dades locals.
    - `domain/`: Capa de negoci per a la feature.
      - `entities/`: Defineix les entitats o models del domini que representen les dades dins la lògica de negoci.
      - `repositories/`: Defineix les interfícies dels repositoris. Aquestes interfícies són implementades a `data/repositories`.
      - `use_cases/`: Defineix els casos d’ús, cada un encapsulant una acció específica dins de la lògica de negoci.
    - `presentation/`: Capa de presentació per a la feature.
      - `providers/`: Conté els gestors d’estat per a la UI d’aquesta feature.
      - `screens/`: Pantalles principals de la feature.
      - `widgets/`: Widgets o components UI reutilitzables dins de la feature.
    - `tests/`: Tests modulars per a la feature.
      - `example_use_case_test.dart`: Test per un cas d'ús concret.
      - `example_screen_test.dart`: Test de widget o de pantalla.

## Convencions de Noms

Per mantenir la coherència i la llegibilitat del codi, seguim les següents convencions de noms:

### Classes i Enums

- Utilitzem el `PascalCase` per a les classes i els enums.
  - Exemple bo: ✔️ `UserProfile`, `GameStatus`
  - Exemple dolent: ❌ `userProfile`, `game_status`, `USERPROFILE`

### Mètodes i Funcions

- Utilitzem el `camelCase` per als noms de mètodes i funcions.
  - Exemple bo: ✔️ `getUserProfile()`, `calculateScore()`
  - Exemple dolent: ❌ `GetUserProfile()`, `calculate_score()`, `calculateScore`

### Variables i Constants

- Utilitzem el `camelCase` per a les variables i constants.
  - Exemple bo: ✔️ `userName`, `gameScore`, `maxPlayers`, `defaultScore`
  - Exemple dolent: ❌ `UserName`, `game_score`, `MAX_PLAYERS`, `default_score`

### Arxius

- Utilitzem el `snake_case` per als noms d'arxius.
  - Exemple bo: ✔️ `user_profile.dart`, `game_status.dart`
  - Exemple dolent: ❌ `UserProfile.dart`, `gameStatus.dart`, `userprofile.dart`

### Widgets

- Utilitzem el `PascalCase` per als noms de widgets.
  - Exemple bo: ✔️ `UserProfileWidget`, `GameScoreWidget`
  - Exemple dolent: ❌ `userProfileWidget`, `game_score_widget`, `Userprofilewidget`

### Tests

- Utilitzem el `snake_case` per als noms d'arxius de tests, seguint el nom de l'arxiu que estan testejant.
  - Exemple bo: ✔️ `user_profile_test.dart`, `game_status_test.dart`
  - Exemple dolent: ❌ `UserProfileTest.dart`, `gameStatusTest.dart`, `userprofiletest.dart`

### Sufixos de Fitxers

- Alguns fitxers utilitzen el seu propi sufix depenent del directori:
  - `models/`: `*_model.dart`
  - `repositories/`: `*_repository.dart`
  - `data_sources/`: `*_data_source.dart`
  - `entities/`: `*_entity.dart`
  - `use_cases/`: `*_use_case.dart`
  - `providers/`: `*_provider.dart`
  - `screens/`: `*_screen.dart`
  - `widgets/`: `*_widget.dart`
  - `implementations/`: `*_impl.dart`

Seguint aquestes convencions, assegurem que el codi sigui fàcil de llegir i mantenir per a tots els membres de l'equip.

## Llicència

Aquest projecte està llicenciat sota la Llicència Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International. Consulta l'arxiu `LICENSE` per a més detalls.
