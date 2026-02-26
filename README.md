1. Requirements

Install these first:

Git

Docker Desktop

Flutter SDK

Android Studio (for Android development)

Check installations:

git --version
docker --version
flutter --version
2. Step 1 — Clone the Project

From GitHub:

git clone https://github.com/kiesike/SmartCacao.git
cd SmartCacao

Project structure:

SmartCacao/
├── backend/     (Laravel + Docker)
└── frontend/    (Flutter)
3. Step 2 — Start the Backend (Laravel + MySQL)

Go to backend:

cd backend

Start Docker containers:

docker compose up -d --build

This will start:

Service	Port
Laravel (Nginx)	9000
phpMyAdmin	9001
MySQL	3307
4. Step 3 — Install Laravel Inside Container

Enter the Laravel container:

docker exec -it quizzard_app bash

Run:

composer install
php artisan key:generate
php artisan migrate
exit
5. Step 4 — Test Backend

Open browser:

http://localhost:9000/api/test

If you see JSON response → Backend is working.

6. Step 5 — Database Access

phpMyAdmin:

http://localhost:9001

Login:

Field	Value
Server	quizzard_mysql
Username	root
Password	root
7. Step 6 — Run Flutter Frontend

Open new terminal.

Go to frontend:

cd frontend

Install dependencies:

flutter pub get

Run app:

For Android
flutter run
For Chrome (testing)
flutter run -d chrome
8. Step 7 — Flutter API Connection

Flutter connects to:

http://localhost:9000/api/

If using Android Emulator, change base URL to:

http://10.0.2.2:9000/api/

File location:

frontend/lib/api_service.dart
9. Step 8 — Verify Full Connection

When everything is running:

Docker containers running

docker ps

Backend test works

http://localhost:9000/api/test

Flutter shows API data

If all three work → Frontend and Backend are connected.

10. Stopping the Project

To stop backend:

cd backend
docker compose down
11. Ports Summary
Service	URL
Laravel API	http://localhost:9000

API Test	http://localhost:9000/api/test

phpMyAdmin	http://localhost:9001

MySQL	localhost:3307

Database:

Field	Value
Database	smartcacao
Username	root
Password	root
12. First Time Notes

First Docker build may take several minutes.

First flutter run may take time (downloads SDK tools).

Always start backend before running Flutter.

13. Project Status

This repository is a development template:

Laravel API ready

Flutter connected

MySQL in Docker

Ready for SmartCacao feature development
