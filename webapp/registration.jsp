<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
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

        .icon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 1rem;
        }

        input {
            width: 100%;
            padding: 0.5rem 0.5rem 0.5rem 2.5rem;
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

        /* Responsive */
        @media (max-width: 480px) {
            .form-container {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="header">MusicStream</div> <!-- Added header -->
    <div class="min-h-screen">
        <div class="form-container">
            <div class="text-center">
                <div class="user-icon">
                    <!-- You can add an icon image here -->
                </div>
                <h1 class="form-title">Create Account</h1>
                <p class="form-subtitle">Sign up to get started</p>
            </div>

            <form action="RegisterServlet" method="post" class="form">
                <div class="form-group">
                    <label for="name">Name</label>
                    <div class="input-wrapper">
                        <span class="icon">👤</span>
                        <input type="text" id="name" name="name" placeholder="John Doe" required />
                    </div>
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <div class="input-wrapper">
                        <span class="icon">👥</span>
                        <input type="text" id="username" name="username" placeholder="johndoe" required />
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <div class="input-wrapper">
                        <span class="icon">✉️</span>
                        <input type="email" id="email" name="email" placeholder="john@example.com" required />
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <span class="icon">🔒</span>
                        <input type="password" id="password" name="password" placeholder="••••••••" required />
                    </div>
                </div>

                <button type="submit" class="submit-btn">Create Account</button>
            </form>
        </div>
    </div>

    <script>
        function handleFormSubmit(event) {
            event.preventDefault();
            const formData = {
                name: document.getElementById('name').value,
                username: document.getElementById('username').value,
                email: document.getElementById('email').value,
                password: document.getElementById('password').value,
            };
            console.log('Form submitted:', formData);
        }
    </script>
</body>
</html>
