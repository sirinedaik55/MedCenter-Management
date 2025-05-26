<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Connexion - Patient Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-blue: #4285f4;
            --light-blue: #e3f2fd;
            --medical-blue: #87ceeb;
            --medical-dark: #5f9ea0;
            --medical-light: #b8e6ff;
            --dark-text: #333333;
            --light-text: #666666;
            --sidebar-bg: #f8f9fa;
            --main-bg: #ffffff;
            --border-color: #e0e0e0;
        }

        body {
            background-image: url('${pageContext.request.contextPath}/images/backgroundregister.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-color: var(--main-bg); /* Fallback color */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--dark-text);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 30px 40px;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            border: 1px solid var(--border-color);
            max-width: 500px; /* Matches the approximate width of col-md-6 col-lg-5 */
            width: 100%;
        }

        .card-header {
            background: none;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .card-header h2 {
            font-size: 32px;
            font-weight: 700;
            color: var(--dark-text);
            margin-bottom: 0;
        }

        .card-body {
            padding: 0;
        }

        .form-label {
            font-weight: 500;
            color: var(--dark-text);
        }

        .form-label i {
            color: var(--medical-dark);
            margin-right: 8px;
        }

        .form-control {
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 10px;
            color: var(--dark-text);
        }

        .form-control:focus {
            border-color: var(--medical-blue);
            box-shadow: 0 0 0 0.2rem rgba(135, 206, 235, 0.25);
        }

        .form-control::placeholder {
            color: var(--light-text);
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
            color: white;
            border: none;
            padding: 15px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(135, 206, 235, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--medical-dark) 0%, #4682b4 100%);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(135, 206, 235, 0.4);
        }

        .text-decoration-none {
            color: var(--medical-dark);
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .text-decoration-none:hover {
            color: var(--medical-blue);
        }

        .text-decoration-none i {
            margin-right: 5px;
        }

        .alert {
            border-radius: 8px;
            padding: 10px;
        }

        .alert i {
            color: inherit;
            margin-right: 8px;
        }

        @media (max-width: 768px) {
            body {
                padding: 20px;
            }

            .card {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="card-header text-center">
            <h2 class="mb-0"><i class="fas fa-user-circle me-2"></i>Connexion</h2>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="mb-4">
                    <label class="form-label"><i class="fas fa-envelope me-2"></i>Email</label>
                    <input type="email" name="email" class="form-control" required 
                           placeholder="Entrez votre email" />
                </div>
                <div class="mb-4">
                    <label class="form-label"><i class="fas fa-lock me-2"></i>Mot de passe</label>
                    <input type="password" name="motDePasse" class="form-control" required 
                           placeholder="Entrez votre mot de passe" />
                </div>
                <button type="submit" class="btn btn-primary btn-lg w-100">
                    <i class="fas fa-sign-in-alt me-2"></i>Se connecter
                </button>
            </form>
            
            <div class="mt-4 text-center">
                <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">
                    <i class="fas fa-user-plus me-1"></i>Pas encore inscrit ? Créer un compte
                </a>
            </div>
            
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger mt-4">
                    <i class="fas fa-exclamation-circle me-2"></i>Identifiants invalides ou rôle non reconnu.
                </div>
            <% } %>
            
            <% if (request.getParameter("registered") != null) { %>
                <div class="alert alert-success mt-4">
                    <i class="fas fa-check-circle me-2"></i>Inscription réussie ! Vous pouvez maintenant vous connecter.
                </div>
            <% } %>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>