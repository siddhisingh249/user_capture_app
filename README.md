# User Management System

A simple Rails application for managing users with search, delete functionality, and daily records report. This application uses Bootstrap for styling and Kaminari for pagination.

## Dependencies

### Ruby and Rails

- Ruby: `3.2.2`
- Rails: `7.1.3`

### Gems

- **Kaminari**: For pagination.

## Getting Started

Follow these instructions to get the project up and running on your local machine.

### Prerequisites

Ensure you have the following installed:

- Ruby
- Rails
- Bundler

### Installation

1. **Clone the repository**:

    ```sh
    git clone https://github.com/siddhisingh249/user_capture_app.git
    cd user_capture_app
    ```

2. **Install dependencies**:

    ```sh
    bundle install
    ```

3. **Set up the database**:

    ```sh
    rails db:create
    rails db:migrate
    ```

4. **Start the Rails server**:

    ```sh
    rails server
    ```

5. **Visit the application**:

    Open your browser and go to `http://localhost:3000`.

## Usage

### Search Users

- Use the search bar at the top of the users index page to search for users by name.

### Delete Users

- Click the "Delete" button next to a user to remove them from the database. This will also update the daily record.

### View Daily Records

- Click the "View Daily Record Report" button to view the daily records report, which shows the average count and age of male and female users.

## Project Structure

### Controllers

- `UsersController`: Handles user listing, searching, and deletion.
- `DailyRecordsController`: Handles displaying the daily records report.

### Models

- `User`: Represents a user with attributes like `name`, `age`, `gender`, and `created_at`.
- `DailyRecord`: Represents daily records with attributes like `date`, `male_count`, `female_count`, `male_avg_age`, and `female_avg_age`.

### Views

- `users/index.html.erb`: Displays the list of users with search and delete functionality.
- `daily_records/index.html.erb`: Displays the daily records report.

## Adding Pagination with Kaminari

We use Kaminari to paginate the list of users.

## Note: 

For running scheduled cron jobs these needs to be installed and running.

- Redis server
- Sidekiq