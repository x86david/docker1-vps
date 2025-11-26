<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Hello World</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #1e3c72, #2a5298);
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }
    h1 {
      font-size: 3rem;
      margin-bottom: 1rem;
      animation: fadeInDown 1s ease-out;
    }
    p {
      font-size: 1.2rem;
      max-width: 600px;
      line-height: 1.5;
      animation: fadeInUp 1.5s ease-out;
    }
    .btn {
      margin-top: 2rem;
      padding: 12px 24px;
      background: #ff9800;
      color: #fff;
      border: none;
      border-radius: 6px;
      font-size: 1rem;
      cursor: pointer;
      text-decoration: none;
      transition: background 0.3s ease;
    }
    .btn:hover {
      background: #e68900;
    }
    @keyframes fadeInDown {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
  <h1>
    <?php echo "Hello World from PHP running in Docker!"; ?>
  </h1>
  <p>
    This is your first containerized webserver running on Docker.  
    You can now expand this into a full application, add routes, or connect to a database.
  </p>
  <a href="https://www.docker.com/" class="btn">Learn More About Docker</a>
</body>
</html>
