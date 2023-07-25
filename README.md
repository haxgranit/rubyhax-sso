# Single Sign-On (SSO) Implementation with Ruby on Rails using Google OAuth
This repository provides a sample implementation of Single Sign-On (SSO) in a Ruby on Rails application using Google OAuth.

Here's a high-level architecture and workflow diagram for the SSO implementation in a Ruby on Rails application:
![image](https://github.com/haxgranit/rubyhax-sso/assets/28113737/58191a63-0467-4a42-b016-667e381b31ff)

![image](https://github.com/haxgranit/rubyhax-sso/assets/28113737/f288a739-3ad1-468a-a44e-ec4be9b4b227)


Description:

1. User: Represents the end-user trying to access the web application.
2. Web Application: The main Ruby on Rails application where the user initiates the login process.
3. SSO Service: The central service responsible for handling Single Sign-On authentication. It communicates with various identity providers (IdPs) to authenticate the user.
4. Identity Providers (IdPs): These are third-party services or custom solutions that validate the user's identity. Examples include Google, Microsoft, Facebook, and custom SAML-based solutions.
5. RBAC Service: This service manages Role-Based Access Control, determining what actions a user can perform within the application based on their assigned roles.
6. Database: Stores user roles and permissions, which the RBAC service queries to enforce access controls.


# Overview
The project demonstrates how to integrate Google OAuth for authentication in a Rails application. It uses the devise gem for user management and the omniauth-google-oauth2 gem for OAuth integration.

# Prerequisites
Ruby version: 3.2.2
Rails version: 7.0.6
PostgreSQL (or adjust the database settings as needed)

# Setup
## Clone the Repository
## Install Dependencies
## Environment Variables

Set up your Google OAuth credentials. You'll need to create a project on the Google Developer Console, enable the Google+ API, and obtain the GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET.

Add these to your environment or use a gem like dotenv to manage them:
  GOOGLE_CLIENT_ID=your_client_id
  GOOGLE_CLIENT_SECRET=your_client_secret

## Usage
  Navigate to the sign-in page.
  Click on "Sign in with Google".
  If authentication is successful, you'll be signed in using your Google account.
