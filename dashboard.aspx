<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maruti Suzuki - Dashboard</title>
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <div class="logo">
                <i class="fas fa-car"></i>
                <span id="user-name">Welcome, <asp:Literal ID="litUsername" runat="server" /></span>
            </div>

            <a href="#dashboard" class="nav-link active">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
            <a href="#billing" class="nav-link">
                <i class="fas fa-calculator"></i>
                <span>Billing</span>
            </a>
            <a href="#stock" class="nav-link">
                <i class="fas fa-box"></i>
                <span>Stock Management</span>
            </a>
            <a href="#reports" class="nav-link">
                <i class="fas fa-chart-bar"></i>
                <span>Reports</span>
            </a>
            <a href="#settings" class="nav-link">
                <i class="fas fa-cog"></i>
                <span>Settings</span>
            </a>
            <div class="user-info">
                <a href="index.aspx" class="logout-btn">Logout</a>
            </div>
        </div>

        <div class="main">
            <section class="dashboard-content">
                <div class="stats-grid">
                    <div class="stat-card">
                        <h3>Total Sales</h3>
                        <div class="stat-value">₹ <asp:Literal ID="litTotalSales" runat="server" /></div>
                        <div class="stat-change">
                            <i class="fas fa-arrow-up text-success"></i>
                            <span>12% Increase</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <h3>Stock Level</h3>
                        <div class="stat-value"><asp:Literal ID="litStockLevel" runat="server" /> Units</div>
                        <div class="stat-change">
                            <i class="fas fa-arrow-down text-warning"></i>
                            <span>5% Decrease</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <h3>Today's Orders</h3>
                        <div class="stat-value"><asp:Literal ID="litTodaysOrders" runat="server" /></div>
                        <div class="stat-change">
                            <i class="fas fa-arrow-up text-success"></i>
                            <span>3 New Orders</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <h3>Low Stock</h3>
                        <div class="stat-value"><asp:Literal ID="litLowStock" runat="server" /> Items</div>
                        <div class="stat-change">
                            <i class="fas fa-exclamation-triangle text-danger"></i>
                            <span>Need Attention</span>
                        </div>
                    </div>
                </div>

                <div class="recent-orders">
                    <h2>Recent Orders</h2>
                    <div class="orders-table">
                        <asp:Repeater ID="rptOrders" runat="server">
                            <HeaderTemplate>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Customer</th>
                                            <th>Amount</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("OrderId") %></td>
                                            <td><%# Eval("CustomerName") %></td>
                                            <td>₹ <%# Eval("Amount") %></td>
                                            <td><span class="status <%# Eval("StatusClass") %>"><%# Eval("Status") %></span></td>
                                            <td><%# Eval("Date", "{0:yyyy-MM-dd}") %></td>
                                        </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                    </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </section>
        </div>
    </form>

    <script src="dashboard.js"></script>
</body>
</html>
