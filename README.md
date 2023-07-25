# Single Sign-On (SSO) Implementation with Ruby on Rails using Google OAuth
This repository provides a sample implementation of Single Sign-On (SSO) in a Ruby on Rails application using Google OAuth.

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
