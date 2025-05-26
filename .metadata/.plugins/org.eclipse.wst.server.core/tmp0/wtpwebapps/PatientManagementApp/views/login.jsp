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
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
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
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
