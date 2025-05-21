# :computer: INCEPTION
**Inception** is a project about **containerizing** multiple services (**MariaDB**, **Nginx**, **WordPress**) and making them **communicate** with each other in order to **host** a website.

![Screenshot from 2025-05-19 11-58-53](https://github.com/user-attachments/assets/071482f2-76e2-4f03-a79e-089909dbbf30)

<br>

## :key: Key components

### Configuration

A hidden **environment** file (.env) will be sent to each container in order to define the **domain** and name of the website and **credentials** for an admin and user of both the **database** and the **website**

### Initialization

A container **image** must be built for each service so all the **dependencies**, **libraries**, and **OS-level files** are know to docker when initializing the container, like a **blueprint**.
A **volume** must also be defined and mounted with **Docker-compose** so the services can store/access data from the **host OS** that persists during and after running services.

```sh
make up  # Creates a folder to use as a volume and starts the services
```

Other **make** commands can also be executed to interact with the application.

```sh
make down        # Stops and removes all containers, images, volumes and cleans the folders used
make recreate    # Calls "down" and then "up" to restart the application from a clean start
make stop        # Stops the application without destroying anything
make start       # Starts the application
make status      # Shows all running containers.
```

### Containerization

With **Docker Compose** all the services are defined and managed by **networking** them in a **bridged network**, mounting a **volume** (directory) to store/read data from, setting up **dependencies** and many other configurations if needed.
A **container** is configured individually using **Docker** and runs in an **isolated environment** but on the same **kernel** as the host OS, therefore **sharing resources** with it and being very **lightweight**. When designing a container, their dependencies can be established to **automate** the deploy of that service on any system that uses **Docker**.

### Automation

After the creation of all containers, each one of them needs to execute a **script** after booting up in order to **safely** start up the service. **MariaDB** will create a database, a user and set up **permissions** or just initialize it if already existing. **WordPress** will use its command line interface (**WP-CLI**) to install itself, **configure** the website, connect to **MariaDB** and set up an **admin**. Finally **Nginx** will generate **SSL certificates** and configure the **virtual hosts** if not done already and start the service.
All the **scripts** are running **simultaneously** so they are protected in order to wait for the services they depend on.

![Screenshot from 2025-05-19 11-53-05](https://github.com/user-attachments/assets/c6f83c58-0a88-495e-8e74-9c57ef88add1)

<br>

## :books: What did I learn?
I learned how to use **Docker** & **Docker-Compose** and also the importance of **isolating** each service in a **larger** and **scalable** project.
The functioning of each service was grasped, understanding why a website needs a **database** (**MariaDB**) to store all the information needed to properly make it function and a **server** (**Nginx**) to host and serve the website itself.
