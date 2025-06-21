using System;
using System.Collections.Generic;

public partial class dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            if (Session["Username"] != null)
            {
                litUsername.Text = Session["Username"].ToString();
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        
            litTotalSales.Text = GetTotalSales().ToString("N0");
            litStockLevel.Text = GetStockLevel().ToString();
            litTodaysOrders.Text = GetTodaysOrders().ToString();
            litLowStock.Text = GetLowStockItems().ToString();

            
            rptOrders.DataSource = GetRecentOrders();
            rptOrders.DataBind();
        }
    }

    protected decimal GetTotalSales()
    {
        return 1250000.00m;
    }

    protected int GetStockLevel()
    {
        return 120;
    }

    protected int GetTodaysOrders()
    {
        return 15;
    }

    protected int GetLowStockItems()
    {
        return 4;
    }

    protected List<Order> GetRecentOrders()
    {
        return new List<Order>
        {
            new Order { OrderId = "ORD001", CustomerName = "Ravi Kumar", Amount = 65000, Status = "Completed", StatusClass = "completed", Date = DateTime.Now.AddDays(-1) },
            new Order { OrderId = "ORD002", CustomerName = "Sneha Singh", Amount = 45000, Status = "Pending", StatusClass = "pending", Date = DateTime.Now },
            new Order { OrderId = "ORD003", CustomerName = "Amit Patel", Amount = 30000, Status = "Shipped", StatusClass = "shipped", Date = DateTime.Now.AddDays(-2) }
        };
    }

    public class Order
    {
        public string OrderId { get; set; }
        public string CustomerName { get; set; }
        public decimal Amount { get; set; }
        public string Status { get; set; }
        public string StatusClass { get; set; }
        public DateTime Date { get; set; }
    }
}
