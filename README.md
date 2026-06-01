# ChatBot

A Flutter chatbot application that integrates with the OpenAI Chat Completions API (`gpt-3.5-turbo`).

## Features

- Login screen with username/password authentication (hardcoded `admin` / `admin`).
- Chat page with scrollable message list.
- Distinct UI for user messages (teal, person icon) and assistant messages (grey, support agent icon).
- Sends user queries to `https://api.openai.com/v1/chat/completions` via HTTP POST and renders the response.

## Tech Stack

- **Flutter** (Dart SDK `^3.11.5`)
- **Material Design** UI
- **http** package (`^1.6.0`) for API calls
- **cupertino_icons** (`^1.0.8`)

## Project Structure

```
lib/
├── main.dart                 # App entry point + HomePage (login)
└── pages/
    └── chatbot.page.dart     # Chat UI + OpenAI integration
```

## Routes

- `/` → `HomePage` (login)
- `/chat` → `chatbotPage` (chat interface)

## Setup

1. Install Flutter SDK.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Add your OpenAI API key in `lib/pages/chatbot.page.dart` (replace the `Authorization` header value).
4. Run:
   ```bash
   flutter run
   ```

## Login

- Username: `admin`
- Password: `admin`

## Notes

- API key is currently a placeholder string and must be set before the chat will function.
- Credentials are hardcoded — not production-ready.
