# URL Shortener

## Introduction

This is a URL Shortener web application that allows users to shorten URLs and track their views over time. It also provides administrative functionalities for managing users, links, and guest users.

## Features

### User Features

1. Submit a URL in a form on the homepage.
2. URLs are saved to the database.
3. Access URLs using a Base62 encoded primary key ID (short code) of the URL (/v/:id).
4. Copy the short URL to the clipboard.
5. Record views when visiting the short code to track views per day.
6. View a graph of the views over the past 2 weeks.
7. Edit and delete URLs.
8. Retrieve the title, description, and open graph image for the HTML document.
    - This runs in the background to keep the application fast.
    - Update title, description, and image if a URL is edited.
9. Paginate the list of shortened URLs.

### Admin Features

- **Dashboard**
    - Show all registered users and guest users on a diagram.
    - Users Chart (Last 7 Days).
    - All Links Views (Last 2 weeks).

- **Users**
    - Show the list of all users.
        - Display the total number of links created by each user.
    - View user profiles.
        - Display basic information about the user.
        - Show all links views for the last 2 weeks.
        - Display all links created by the user.
        - Edit links as an admin.
    - Destroy or edit users and links.

- **Guest User**
    - Show the list of all guest users.
    - Show their IP addresses.

## Technologies Used

- Ruby on Rails for the backend
- PostgreSQL for the database
- Devise for authentication
- Chartkick for generating charts
- Pagy for generating pagination
- Background job processing (e.g., Sidekiq, Delayed Job) for fetching metadata asynchronously
- Tailwind CSS for front-end design and layout

## Installation and Setup

1. Clone the repository (`git clone https://github.com/Mdromi/url_shortener`).
2. Install Ruby and Rails dependencies (`bundle install`).
3. Set up the database (`rails db:setup`). This will create the database, load the schema, and initialize it with seed data.
4. Set up the database (`rails db:setup`).
5. Start the Rails server (`rails server`).
6. Visit `http://localhost:3000` in your web browser.
7. To login to the admin dashboard, use the following credentials:
   - Email: admin@example.com
   - Password: password

## Usage

1. Register or log in to the application.
2. Shorten a URL by submitting it on the homepage.
3. View, edit, or delete URLs from your dashboard.
4. View URL statistics and graphs.
5. Access admin functionalities from the admin panel.

## Contributors

- [Md Romi](https://github.com/mdromi)
- [Live](https://url-shortener-qkvt.onrender.com/)

## License

This project is licensed under the [MIT License](LICENSE).
