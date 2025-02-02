# Website Customer Tracker

This project is an SQL-based solution to track customer activities, including login sessions, logoff tracking, and device login limits using stored procedures and triggers.

## Features
- **Login Management**: Track customer logins, logoffs, and active sessions.
- **Device Tracking**: Manage and restrict the number of devices used by each user.
- **Session Expiry**: Automatically log users out after a period of inactivity.
- **Stored Procedures**: Handle login and session activities.
- **Triggers**: Ensure database integrity and enforce login limits.

## Database Design
The database uses the following key tables:
- `Users`: Stores user information.
- `Sessions`: Tracks active and expired sessions.
- `Devices`: Limits the number of devices each user can login to.
- `AuditLogs`: Logs all user activities for monitoring purposes.

## Technologies
- **SQL**: Core database language.
- **MySQL** or **PostgreSQL**: (Specify your choice of DBMS)
- **Stored Procedures** and **Triggers** for business logic implementation.

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Website-Customer-Tracker.git
2. Import the SQL files in your preferred database management system.
3. Run the stored procedures and triggers as described in the docs/ folder.

## Usage
- After setting up the database, execute the Login stored procedure to simulate user logins.
- The system will automatically manage session timeouts and device limits.
- Use the audit log to track user activities.

## Contributing
- Feel free to fork this repository and submit pull requests if you want to contribute.

