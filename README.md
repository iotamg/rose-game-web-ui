# rose-game-web-ui
Web based user interface for the ROSE game.

ROSE project: https://github.com/RedHat-Israel/ROSE

Run the rose reference driver:

``` bash
# Get help
podman run --rm --network host -it quay.io/rose/rose-game-ai-reference:latest --help

# Run the driver on localhost port 8082 (default port in 8081)
podman run --rm --network host -it quay.io/rose/rose-game-ai-reference:latest --port 8082
```

Run the rose game engine:

``` bash
# Start the ROSE game game engine, and connect to the Go driver
podman run --rm \
  --network host \
  -it quay.io/rose/rose-game-engine:latest \
  --drivers http://127.0.0.1:8082
```

Run the rose game web UI:

```bash
podman run --rm --network host -it quay.io/rose/rose-game-web-ui:latest
```

Run locally:

```bash
npm start
```

Browse to http://127.0.0.1:8080 to run the game.