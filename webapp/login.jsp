<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Resetting some defaults */
        body, html {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Header Styles */
        .header {
            background-color: #6b5b9a; /* Purple color */
            color: #ffffff;
            padding: 1rem;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
        }

        /* Background Gradient */
        .min-h-screen {
            min-height: 100vh;
            background: linear-gradient(to bottom right, #ebf4ff, #e0e7ff);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        /* Form Container */
        .form-container {
            background-color: #ffffff;
            max-width: 400px;
            width: 100%;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Title and Subtitle */
        .form-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #1e293b;
            margin-top: 1rem;
        }

        .form-subtitle {
            color: #64748b;
            margin-top: 0.25rem;
        }

        /* Form Group */
        .form-group {
            margin-bottom: 1rem;
            text-align: left;
        }

        label {
            font-size: 0.875rem;
            font-weight: 500;
            color: #374151;
            display: block;
            margin-bottom: 0.25rem;
        }

        /* Input Wrapper */
        .input-wrapper {
            position: relative;
        }

        input {
            width: 100%;
            padding: 0.5rem 0.5rem 0.5rem 1rem; /* Updated padding */
            border: 1px solid #d1d5db;
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }

        /* Submit Button */
        .submit-btn {
            background-color: #6366f1;
            color: #ffffff;
            padding: 0.75rem;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #4f46e5;
        }

        /* Register Link */
        .register-link {
            margin-top: 1rem;
        }

        .register-link a {
            color: #6366f1;
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .form-container {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="header">MusicStream</div>
    <div class="min-h-screen">
        <div class="form-container">
            <h1 class="form-title">Login</h1>
            <p class="form-subtitle">Enter your credentials</p>
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <div class="input-wrapper">
                        <input type="text" id="username" name="username" required placeholder="Enter your username">
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" required placeholder="Enter your password">
                    </div>
                </div>

                <button type="submit" class="submit-btn">Login</button>
            </form>
            <div class="register-link">
                <a href="registration.jsp">Register</a>
            </div>
        </div>
    </div>
</body>
</html>
