<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Profil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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
        background-color: var(--main-bg);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: var(--dark-text);
    }

    .sidebar {
        background-color: var(--sidebar-bg);
        min-height: 100vh;
        padding: 30px 20px;
        border-right: 1px solid var(--border-color);
    }

    .sidebar h3 {
        font-size: 18px;
        font-weight: 600;
        color: var(--dark-text);
        margin-bottom: 40px;
        padding-bottom: 20px;
        border-bottom: 1px solid var(--border-color);
    }

    .sidebar .nav-link {
        color: var(--light-text);
        padding: 12px 15px;
        margin: 4px 0;
        border-radius: 8px;
        transition: all 0.3s ease;
        font-weight: 500;
        display: flex;
        align-items: center;
    }

    .sidebar .nav-link i {
        width: 20px;
        margin-right: 12px;
    }

    .sidebar .nav-link:hover {
        background-color: var(--medical-light);
        color: var(--medical-dark);
    }

    .sidebar .nav-link.active {
        background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
        color: white;
    }

    .main-content {
        padding: 30px 40px;
        background-color: var(--main-bg);
    }

    .page-header {
        margin-bottom: 30px;
    }

    .page-header h2 {
        font-size: 32px;
        font-weight: 700;
        color: var(--dark-text);
        margin-bottom: 8px;
    }

    .page-header p {
        color: var(--light-text);
        font-size: 16px;
        margin-bottom: 0;
    }

    .profile-card {
        background: white;
        border-radius: 12px;
        padding: 30px;
        margin-bottom: 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        border: 1px solid var(--border-color);
    }

    .profile-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .profile-avatar {
        width: 60px;
        height: 60px;
        border-radius: 12px;
        background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 20px;
        font-size: 24px;
        color: white;
    }

    .profile-name {
        font-size: 24px;
        font-weight: 600;
        color: var(--dark-text);
        margin-bottom: 5px;
    }

    .profile-role {
        color: var(--light-text);
        font-size: 16px;
    }

    .info-section {
        margin-bottom: 30px;
    }

    .info-section h5 {
        font-size: 20px;
        font-weight: 600;
        color: var(--dark-text);
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 1px solid var(--border-color);
    }

    .info-item {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
        padding: 10px;
        background-color: var(--main-bg);
        border-radius: 8px;
        border: 1px solid var(--border-color);
    }

    .info-item i {
        color: var(--medical-dark);
        font-size: 1.2rem;
        margin-right: 15px;
        width: 24px;
        text-align: center;
    }

    .info-label {
        font-weight: 500;
        color: var(--dark-text);
        margin-right: 10px;
    }

    .info-value {
        color: var(--light-text);
    }

    .action-button {
        background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
        color: white;
        border: none;
        padding: 15px 20px;
        border-radius: 8px;
        font-weight: 500;
        transition: all 0.3s ease;
        box-shadow: 0 2px 8px rgba(135, 206, 235, 0.3);
    }

    .action-button:hover {
        background: linear-gradient(135deg, var(--medical-dark) 0%, #4682b4 100%);
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(135, 206, 235, 0.4);
    }

    .form-control {
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 10px;
    }

    .form-control:focus {
        border-color: var(--medical-blue);
        box-shadow: 0 0 0 0.2rem rgba(135, 206, 235, 0.25);
    }

    @media (max-width: 768px) {
        .main-content {
            padding: 20px;
        }
    }
</style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar">
                <h3 class="mb-4">${sessionScope.utilisateur.nom}</h3>
                <nav class="nav flex-column">
                    <a class="nav-link" href="${pageContext.request.contextPath}/patient/dashboard">
                        <i class="fas fa-tachometer-alt me-2"></i>Tableau de bord
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/patient/rendez-vous">
                        <i class="fas fa-calendar-alt me-2"></i>Rendez-vous
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/patient/dossier">
                        <i class="fas fa-folder me-2"></i>Mon dossier
                    </a>
                    <a class="nav-link active" href="${pageContext.request.contextPath}/patient/profile">
                        <i class="fas fa-user me-2"></i>Mon profil
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                        <i class="fas fa-sign-out-alt me-2"></i>Déconnexion
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <!-- Page Header -->
                <div class="page-header">
                    <h2 class="mb-0">Mon Profil</h2>
                    <p class="mb-0">Gérez vos informations personnelles</p>
                </div>

                <!-- Profile Card -->
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <h2 class="profile-name">${patient.utilisateur.nom} ${patient.utilisateur.prenom}</h2>
                        <p class="profile-role">Patient</p>
                    </div>

                    <!-- Personal Information -->
                    <div class="info-section">
                        <h5><i class="fas fa-user me-2"></i>Informations Personnelles</h5>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="info-item">
                                    <i class="fas fa-id-card"></i>
                                    <span class="info-label">Nom:</span>
                                    <span class="info-value">${patient.utilisateur.nom}</span>
                                </div>
                                <div class="info-item">
                                    <i class="fas fa-birthday-cake"></i>
                                    <span class="info-label">Date de naissance:</span>
                                    <span class="info-value">
                                        <fmt:formatDate value="${patient.dateNaissance}" pattern="dd/MM/yyyy"/>
                                    </span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="info-item">
                                    <i class="fas fa-envelope"></i>
                                    <span class="info-label">Email:</span>
                                    <span class="info-value">${patient.utilisateur.email}</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Update Profile Form -->
                    <div class="info-section">
                        <h5><i class="fas fa-edit me-2"></i>Modifier mes informations</h5>
                        <form action="${pageContext.request.contextPath}/patient/profile" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="numeroSecuriteSociale" class="form-label">Numéro de sécurité sociale</label>
                                    <input type="text" class="form-control" id="numeroSecuriteSociale" name="numeroSecuriteSociale" 
                                           value="${patient.numeroSecuriteSociale}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="dateNaissance" class="form-label">Date de naissance</label>
                                    <input type="date" class="form-control" id="dateNaissance" name="dateNaissance" 
                                           value="<fmt:formatDate value='${patient.dateNaissance}' pattern='yyyy-MM-dd'/>" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="groupeSanguin" class="form-label">Groupe sanguin</label>
                                    <select class="form-control" id="groupeSanguin" name="groupeSanguin" required>
                                        <option value="">Sélectionnez un groupe</option>
                                        <option value="A+" ${patient.groupeSanguin == 'A+' ? 'selected' : ''}>A+</option>
                                        <option value="A-" ${patient.groupeSanguin == 'A-' ? 'selected' : ''}>A-</option>
                                        <option value="B+" ${patient.groupeSanguin == 'B+' ? 'selected' : ''}>B+</option>
                                        <option value="B-" ${patient.groupeSanguin == 'B-' ? 'selected' : ''}>B-</option>
                                        <option value="AB+" ${patient.groupeSanguin == 'AB+' ? 'selected' : ''}>AB+</option>
                                        <option value="AB-" ${patient.groupeSanguin == 'AB-' ? 'selected' : ''}>AB-</option>
                                        <option value="O+" ${patient.groupeSanguin == 'O+' ? 'selected' : ''}>O+</option>
                                        <option value="O-" ${patient.groupeSanguin == 'O-' ? 'selected' : ''}>O-</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="antecedentsMedicaux" class="form-label">Antécédents médicaux</label>
                                    <textarea class="form-control" id="antecedentsMedicaux" name="antecedentsMedicaux" 
                                              rows="3">${patient.antecedentsMedicaux}</textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           value="${patient.utilisateur.email}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="password" class="form-label">Nouveau mot de passe</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="confirmPassword" class="form-label">Confirmer le mot de passe</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                                </div>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn action-button">
                                    <i class="fas fa-save me-2"></i>Enregistrer les modifications
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Password validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password && password !== confirmPassword) {
                e.preventDefault();
                alert('Les mots de passe ne correspondent pas.');
            }
        });
    </script>
</body>
</html>