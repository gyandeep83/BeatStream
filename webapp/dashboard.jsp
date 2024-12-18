<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        h1 {
            font-size: 2em;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .dashboard-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .stat-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            flex: 1 1 calc(25% - 20px); /* Adjusts for spacing */
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .icon-container {
            background-color: #e0e7ff;
            border-radius: 50%;
            padding: 10px;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .stat-title {
            font-size: 0.875em;
            color: #6c757d;
        }
        .stat-value {
            font-size: 1.5em;
            font-weight: bold;
        }
        .recent-activity {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }
        .activity-item {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 15px;
        }
        .activity-item:last-child {
            margin-bottom: 0;
        }
        .activity-icon {
            font-size: 20px;
            color: #4f46e5;
        }
        .activity-description {
            flex: 1;
        }
        .activity-title {
            font-weight: bold;
        }
        .activity-time {
            font-size: 0.875em;
            color: #6c757d;
        }
        /* New styles for audio upload */
        .audio-upload {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }
        .audio-upload h2 {
            margin-top: 0;
        }
        .audio-upload input[type="file"] {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>Admin Dashboard</h1>

    <div class="dashboard-container" id="dashboard"></div>

    <div class="recent-activity" id="recentActivity">
        <h2>Recent Activity</h2>
    </div>

    <script>
        // Stats data
        const stats = [
            { title: 'Total Users', value: '10,234', icon: '👥' },
            { title: 'Total Songs', value: '50,000+', icon: '🎵' },
            { title: 'Active Streams', value: '1,234', icon: '▶️' },
            { title: 'Revenue', value: '$15,678', icon: '💰' },
        ];

        // Recent activities data
        const recentActivities = [
            { icon: '👥', title: 'New User Registration', description: 'John Doe joined 5 minutes ago' },
            { icon: '🎵', title: 'New Song Upload', description: '"Awesome Track" by Cool Artist added 15 minutes ago' },
            { icon: '💰', title: 'Revenue Milestone', description: '$10,000 in daily revenue reached' },
        ];

        // Function to render stats
        function renderStats() {
            const dashboard = document.getElementById('dashboard');
            stats.forEach(stat => {
                const statCard = document.createElement('div');
                statCard.className = 'stat-card';
                statCard.innerHTML = `
                    <div class="icon-container">${stat.icon}</div>
                    <div>
                        <p class="stat-title">${stat.title}</p>
                        <p class="stat-value">${stat.value}</p>
                    </div>
                `;
                dashboard.appendChild(statCard);
            });
        }

        // Function to render recent activities
        function renderRecentActivities() {
            const recentActivityContainer = document.getElementById('recentActivity');
            recentActivities.forEach(activity => {
                const activityItem = document.createElement('div');
                activityItem.className = 'activity-item';
                activityItem.innerHTML = `
                    <div class="activity-icon">${activity.icon}</div>
                    <div class="activity-description">
                        <p class="activity-title">${activity.title}</p>
                        <p class="activity-time">${activity.description}</p>
                    </div>
                `;
                recentActivityContainer.appendChild(activityItem);
            });
        }

        // Initial render
        renderStats();
        renderRecentActivities();
    </script>
</body>
</html>

