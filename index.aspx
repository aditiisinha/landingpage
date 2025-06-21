<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maruti Suzuki - Billing & Stock Management</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

    <script>
        let captchaText = '';

        function generateCaptcha() {
            const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            captchaText = '';
            for (let i = 0; i < 6; i++) {
                captchaText += chars.charAt(Math.floor(Math.random() * chars.length));
            }
            document.getElementById('captchaText').textContent = captchaText;
        }

        function validateCaptchaAndSubmit(event) {
            event.preventDefault();

            const userCaptcha = document.getElementById('<%= txtCaptchaInput.ClientID %>').value;
            if (userCaptcha.toLowerCase() !== captchaText.toLowerCase()) {
                alert('Invalid CAPTCHA! Please try again.');
                generateCaptcha();
                return;
            }

            __doPostBack('<%= btnLogin.UniqueID %>', '');
        }

        window.onload = function () {
            generateCaptcha();
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav>
                <div class="logo">
                    <i class="fas fa-car"></i>
                    <span>Maruti Suzuki</span>
                </div>
                <ul>
                    <li><a href="#home">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#features">Features</a></li>
                    <li><a href="#services">Services</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <section id="hero">
                <div class="hero-background active"></div>
                <div class="hero-background"></div>
                <div class="hero-container">
                    <div class="hero-content">
                        <h1>Billing & Inventory Management</h1>
                        <p>Streamline your operations with our advanced automotive management system</p>
                        <button class="cta-button">Get Started</button>
                    </div>
                    <div class="login-form">
                        <h2>Login</h2>
                        <div class="form-group">
                            <label for="txtUsername">Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPassword">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Enter CAPTCHA</label>
                            <div class="captcha-container">
                                <span id="captchaText"></span>
                                <button type="button" onclick="generateCaptcha()" class="refresh-captcha">
                                    <i class="fas fa-sync-alt"></i>
                                </button>
                            </div>
                            <asp:TextBox ID="txtCaptchaInput" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Button ID="btnLogin" runat="server" CssClass="login-button" Text="Sign In" OnClick="btnLogin_Click" OnClientClick="return validateCaptchaAndSubmit(event);" UseSubmitBehavior="false" />
                        </div>
                        <div class="form-group">
                            <a href="#" class="forgot-password">Forgot Password?</a>
                        </div>
                    </div>
                </div>
            </section>

            <section id="about" class="about-section">
                <div class="container">
                    <h2>About Us</h2>
                    <div class="about-content">
                        <div class="about-text">
                            <p>Maruti Suzuki is India's leading automobile manufacturer...</p>
                            <p>Track sales and performance metrics while maintaining accurate records and reports...</p>
                        </div>
                        <div class="about-image">
                            <img src="4.webp" alt="Maruti Suzuki Vehicle">
                        </div>
                    </div>
                </div>
            </section>

            <script>
                let currentImage = 0;
                const backgrounds = document.querySelectorAll('.hero-background');

                function switchImage() {
                    backgrounds[currentImage].classList.remove('active');
                    currentImage = (currentImage + 1) % backgrounds.length;
                    backgrounds[currentImage].classList.add('active');
                }

                setInterval(switchImage, 5000);
            </script>

            <section id="features">
                <h2>Key Features</h2>
                <div class="features-grid">
                    <div class="feature-card">
                        <i class="fas fa-calculator"></i>
                        <h3>Smart Billing</h3>
                        <p>Efficient billing system with real-time calculations</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-box"></i>
                        <h3>Stock Management</h3>
                        <p>Track inventory levels and manage stock efficiently</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-chart-line"></i>
                        <h3>Analytics</h3>
                        <p>Gain insights with comprehensive business analytics</p>
                    </div>
                </div>
            </section>

            <section id="services">
                <h2>Our Services</h2>
                <div class="services-grid">
                    <div class="service-card">
                        <i class="fas fa-cogs"></i>
                        <h3>System Integration</h3>
                        <p>Seamless integration with existing systems</p>
                    </div>
                    <div class="service-card">
                        <i class="fas fa-shield-alt"></i>
                        <h3>24/7 Support</h3>
                        <p>Round-the-clock technical support</p>
                    </div>
                    <div class="service-card">
                        <i class="fas fa-cloud"></i>
                        <h3>Cloud Solutions</h3>
                        <p>Secure cloud-based management system</p>
                    </div>
                </div>
            </section>
        </main>

        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Contact Us</h3>
                    <p>Email: info@marutisuzuki.com</p>
                    <p>Phone: +91 123 456 7890</p>
                </div>
                <div class="footer-section">
                    <h3>Follow Us</h3>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
