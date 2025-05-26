<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord Patient</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-blue: #4285f4;
            --light-blue: #e3f2fd;
            --medical-blue: #87ceeb;
            --medical-light: #b8e6ff;
            --medical-dark: #5f9ea0;
            --dark-text: #333333;
            --light-text: #666666;
            --sidebar-bg: #f8f9fa;
            --main-bg: #ffffff;
            --border-color: #e0e0e0;
            --navbar-bg: #2c3e50;
            --navbar-text: #ecf0f1;
        }

        body {
            background-color: var(--main-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--dark-text);
        }

        /* Navbar Styles */
        .navbar {
            background-color: #ffffff;
            border-bottom: 1px solid var(--border-color);
            padding: 15px 20px;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
        }

        .navbar-logo {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
        }

        .navbar-logo i {
            color: white;
            font-size: 20px;
        }

        .navbar-title {
            font-size: 16px;
            font-weight: 600;
            color: var(--dark-text);
        }

        .navbar-subtitle {
            font-size: 12px;
            color: var(--light-text);
        }

        .navbar-nav .nav-link {
            color: var(--light-text);
            padding: 8px 15px;
            margin: 0 5px;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .navbar-nav .nav-link i {
            margin-right: 8px;
        }

        .navbar-nav .nav-link:hover {
            background-color: var(--medical-light);
            color: var(--medical-dark);
        }

        .navbar-nav .nav-link.active {
            background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
            color: white;
        }

        .sidebar {
            background-color: var(--sidebar-bg);
            min-height: 100vh;
            padding: 30px 20px;
            border-right: 1px solid var(--border-color);
        }

        .sidebar-header {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border-color);
        }

        .sidebar-logo {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }

        .sidebar-logo i {
            color: white;
            font-size: 24px;
        }

        .sidebar-title {
            margin: 0;
            font-size: 18px;
            font-weight: 600;
            color: var(--dark-text);
        }

        .sidebar-subtitle {
            margin: 0;
            font-size: 14px;
            color: var(--light-text);
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

        .page-title {
            font-size: 32px;
            font-weight: 700;
            color: var(--dark-text);
            margin-bottom: 8px;
        }

        .page-subtitle {
            color: var(--light-text);
            font-size: 16px;
            margin-bottom: 0;
        }

        .content-row {
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        .content-left {
            flex: 1;
        }

        .content-right {
            width: 300px;
            flex-shrink: 0;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            border: 1px solid var(--border-color);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
        }

        .stat-card-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: white;
        }

        .stat-card-icon.diseases { 
            background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
        }
        .stat-card-icon.consultations { 
            background: linear-gradient(135deg, #20b2aa 0%, #008b8b 100%);
        }
        .stat-card-icon.reports { 
            background: linear-gradient(135deg, #4682b4 0%, #2f4f4f 100%);
        }

        .stat-value {
            font-size: 36px;
            font-weight: 700;
            color: var(--dark-text);
            margin-bottom: 8px;
        }

        .stat-label {
            color: var(--light-text);
            font-size: 16px;
            font-weight: 500;
        }

        .stat-description {
            color: var(--light-text);
            font-size: 14px;
            margin-top: 8px;
        }

        .view-details-link {
            color: var(--medical-dark);
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
            display: inline-flex;
            align-items: center;
            margin-top: 15px;
            transition: color 0.3s ease;
        }

        .view-details-link:hover {
            color: var(--medical-blue);
        }

        .view-details-link i {
            margin-left: 5px;
            font-size: 12px;
        }

        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            border: 1px solid var(--border-color);
        }

        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--dark-text);
            margin-bottom: 20px;
        }

        .appointment-card {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 15px;
            border-left: 4px solid var(--medical-blue);
        }

        .appointment-time {
            font-size: 16px;
            font-weight: 600;
            color: var(--dark-text);
            margin-bottom: 5px;
        }

        .appointment-doctor {
            color: var(--light-text);
            font-size: 14px;
            margin-bottom: 8px;
        }

        .status-badge {
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            text-transform: uppercase;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-confirmed {
            background-color: #d1ecf1;
            color: #0c5460;
        }

        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }

        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
        }

        .action-button {
            background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
            color: white;
            border: none;
            padding: 15px 20px;
            border-radius: 8px;
            font-weight: 500;
            text-decoration: none;
            text-align: center;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(135, 206, 235, 0.3);
        }

        .action-button:hover {
            background: linear-gradient(135deg, var(--medical-dark) 0%, #4682b4 100%);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(135, 206, 235, 0.4);
        }

        .action-button i {
            margin-right: 8px;
        }

        .medical-illustration {
            width: 100%;
            height: 400px;
            background: linear-gradient(135deg, var(--medical-light) 0%, var(--medical-blue) 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            position: relative;
            overflow: hidden;
            background-image: url('${pageContext.request.contextPath}/images/xray-body.png');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            box-shadow: 0 4px 15px rgba(135, 206, 235, 0.2);
        }

        .medical-illustration::before {
            content: '';
            position: absolute;
            width: 120px;
            height: 120px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            top: 20px;
            right: 20px;
        }

        .recent-activity {
            list-style: none;
            padding: 0;
        }

        .recent-activity li {
            padding: 12px 0;
            border-bottom: 1px solid var(--border-color);
            font-size: 14px;
            color: var(--light-text);
        }

        .recent-activity li:last-child {
            border-bottom: none;
        }

        .recent-activity li::before {
            content: '•';
            color: var(--medical-blue);
            margin-right: 10px;
        }

        /* Appointment details button styling */
        .btn-details {
            background: linear-gradient(135deg, var(--medical-blue) 0%, var(--medical-dark) 100%);
            color: white;
            border: none;
            border-radius: 6px;
            padding: 8px 16px;
            transition: all 0.3s ease;
        }

        .btn-details:hover {
            background: linear-gradient(135deg, var(--medical-dark) 0%, #4682b4 100%);
            color: white;
            transform: translateY(-1px);
        }

        @media (max-width: 768px) {
            .content-row {
                flex-direction: column;
            }
            
            .content-right {
                width: 100%;
            }
            
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .main-content {
                padding: 20px;
            }
            
            .action-buttons {
                grid-template-columns: 1fr;
            }

            .navbar-nav {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/patient/dashboard">
                <div class="navbar-logo">
                    <i class="fas fa-user-md"></i>
                </div>
                <div>
                    <div class="navbar-title">DME</div>
                    <div class="navbar-subtitle">Dossier Médical Électronique</div>
                </div>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/patient/dashboard">
                            <i class="fas fa-tachometer-alt"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="gestionPatientDropdown" role="button" 
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Gestion Patient
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="gestionPatientDropdown">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/patient/rendez-vous">
                                <i class="fas fa-stethoscope"></i>Maladies
                            </a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/patient/dossier">
                                <i class="fas fa-calendar-alt"></i>Consultations
                            </a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="compteDropdown" role="button" 
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Page Compte
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="compteDropdown">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/patient/profile">
                                <i class="fas fa-user"></i>Profil
                            </a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/patient/reports">
                                <i class="fas fa-file-alt"></i>Rapports
                            </a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar">
                <div class="sidebar-header">
                    <div class="sidebar-logo">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <div>
                        <div class="sidebar-title">${sessionScope.utilisateur.nom} ${sessionScope.utilisateur.prenom}</div>
                        
                    </div>
                </div>
                
                <nav class="nav flex-column">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/patient/dashboard">
                        <i class="fas fa-tachometer-alt"></i>Dashboard
                    </a>
                    <h6 class="sidebar-heading text-muted mt-4 mb-2" style="font-size: 12px; text-transform: uppercase; font-weight: 600;">Gestion Patient</h6>
                    <a class="nav-link" href="${pageContext.request.contextPath}/patient/rendez-vous">
                        <i class="fas fa-stethoscope"></i>Rendez-vous
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/patient/dossier">
                        <i class="fas fa-calendar-alt"></i>Mon dossier
                    </a>
                    <h6 class="sidebar-heading text-muted mt-4 mb-2" style="font-size: 12px; text-transform: uppercase; font-weight: 600;">Page Compte</h6>
                    <a class="nav-link" href="${pageContext.request.contextPath}/patient/profile">
                        <i class="fas fa-user"></i>Profil
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/patient/reports">
                        <i class="fas fa-file-alt"></i>Rapports
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <div class="page-header">
                    <h1 class="page-title"><strong>Mon Dossier Médical Électronique</strong></h1>
                    <p class="page-subtitle">Accédez à toutes vos informations médicales en un seul endroit sécurisé.</p>
                </div>

                <div class="content-row">
                    <div class="content-left">
                        <!-- Statistics Cards -->
                        <div class="stats-grid">
                            <div class="stat-card">
                                <div class="stat-card-icon diseases">
                                    <i class="fas fa-stethoscope"></i>
                                </div>
                                <div class="stat-value">${nombreMedecins}</div>
                                <div class="stat-label">Maladies</div>
                                <div class="stat-description">Voir les conditions médicales et diagnostics</div>
                                <a href="${pageContext.request.contextPath}/patient/maladies" class="view-details-link">
                                    Voir Détails <i class="fas fa-arrow-right"></i>
                                </a>
                            </div>
                            
                            <div class="stat-card">
                                <div class="stat-card-icon consultations">
                                    <i class="fas fa-calendar-alt"></i>
                                </div>
                                <div class="stat-value">${nombreRendezVous}</div>
                                <div class="stat-label">Consultations</div>
                                <div class="stat-description">Voir les visites médicales programmées et passées</div>
                                <a href="${pageContext.request.contextPath}/patient/rendez-vous" class="view-details-link">
                                    Voir Détails <i class="fas fa-arrow-right"></i>
                                </a>
                            </div>
                            
                            <div class="stat-card">
                                <div class="stat-card-icon reports">
                                    <i class="fas fa-file-alt"></i>
                                </div>
                                <div class="stat-value">${nombreConsultations}</div>
                                <div class="stat-label">Rapports</div>
                                <div class="stat-description">Voir et télécharger vos rapports médicaux</div>
                                <a href="${pageContext.request.contextPath}/patient/rapports" class="view-details-link">
                                    Voir Détails <i class="fas fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>

                        <!-- Quick Actions -->
                        <div class="section-card">
                            <h3 class="section-title">Actions Rapides</h3>
                            <div class="action-buttons">
                                <a href="${pageContext.request.contextPath}/patient/rendez-vous/nouveau" class="action-button">
                                    <i class="fas fa-calendar-plus"></i>Prendre rendez-vous
                                </a>
                                <a href="${pageContext.request.contextPath}/patient/dossier" class="action-button">
                                    <i class="fas fa-file-medical"></i>Consulter mon dossier
                                </a>
                                <a href="${pageContext.request.contextPath}/patient/profile" class="action-button">
                                    <i class="fas fa-user-edit"></i>Modifier mon profil
                                </a>
                            </div>
                        </div>

                        <!-- Upcoming Appointments -->
                        <div class="section-card">
                            <h3 class="section-title">Prochains rendez-vous</h3>
                            <c:choose>
                                <c:when test="${empty prochainsRendezVous}">
                                    <p class="text-muted">Vous n'avez pas de rendez-vous à venir.</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${prochainsRendezVous}" var="rdv">
                                        <div class="appointment-card">
                                            <div class="row align-items-center">
                                                <div class="col-md-3">
                                                    <div class="appointment-time">
                                                        <i class="fas fa-clock me-2"></i>
                                                        <fmt:formatDate value="${rd8v.dateHeure}" pattern="dd/MM/yyyy HH:mm"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="appointment-doctor">
                                                        <i class="fas fa-user-md me-2"></i>
                                                        Dr. ${rdv.medecin.utilisateur.nom} ${rdv.medecin.utilisateur.prenom}
                                                        <small class="d-block text-muted">${rdv.medecin.specialite.nom}</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <span class="status-badge ${rdv.statut eq 'en attente' ? 'status-pending' : 
                                                                              rdv.statut eq 'accepté' ? 'status-confirmed' : 
                                                                              'status-cancelled'}">
                                                        ${rdv.statut}
                                                    </span>
                                                </div>
                                                <div class="col-md-3 text-end">
                                                    <a href="${pageContext.request.contextPath}/patient/rendez-vous/${rdv.id}" 
                                                       class="btn btn-sm btn-details">
                                                        <i class="fas fa-eye me-2"></i>Détails
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="content-right">
                        <!-- Medical Illustration -->
                        <div class="medical-illustration">
                            <!-- SVG illustration embedded as background -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>