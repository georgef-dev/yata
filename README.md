# YATA (Yet Another Todo App)

YATA is a simple, yet powerful, todo list application built with Ruby on Rails. It allows users to manage their tasks, organize them with labels, and keep track of their progress.

## Features

- **User Authentication:** Secure user authentication powered by Devise.
- **Todo Management:** Create, read, update, and delete (CRUD) todo items.
- **Labeling:** Organize todos with custom labels.
- **Modern Tech Stack:** Built with Rails 8, Hotwire (Turbo and Stimulus), and Tailwind CSS.
- **Containerized:** Docker and Kamal support for easy deployment.

## Getting Started with Docker

This is the recommended way to run YATA for development.

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/georgef-dev/yata.git
    cd yata
    ```

2.  **Build and start the services:**

    ```bash
    docker-compose up --build -d
    ```

    This command builds the Docker images, starts the `web` and `db` services, and runs them in the background (`-d`).

3.  **Set up the database:**

    Once the containers are running, execute the following commands to create and migrate the database:

    ```bash
    docker-compose exec web rails db:create
    docker-compose exec web rails db:migrate
    ```

The application is now running and available at `http://localhost:3000`.

To view the application logs, run `docker-compose logs -f web`.

To stop the services, run `docker-compose down`.

### Running Tests

To run the test suite, execute the following command:

```bash
docker-compose exec web rails test
```

## Docker

Pull the image from the GitHub Container Registry:

```bash
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
docker pull ghcr.io/georgef-dev/yata:[TAG]
```

Replace `[TAG]` with the desired tag.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue.

## License

YATA is released under the [MIT License](https://opensource.org/license/MIT).
