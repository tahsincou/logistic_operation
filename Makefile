setup:
	chmod +x scripts/setup-environment.sh
	./scripts/setup-environment.sh

clean:
	flutter clean

get:
	flutter pub get

run:
	flutter run