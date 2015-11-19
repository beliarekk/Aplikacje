using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((!Roles.IsUserInRole("Admin")))
        {
            MenuItemCollection menuItems = NavigationMenu.Items;
            MenuItem adminItem1 = new MenuItem();
            MenuItem adminItem2 = new MenuItem();
            foreach (MenuItem menuItem in menuItems)
            {
                // if (menuItem.Text == "Roles")
                if (menuItem.Text == "Edytuj znizki")
                    adminItem1 = menuItem;

                if (menuItem.Text == "Edytuj pokoje")
                    adminItem2 = menuItem;


            }
            menuItems.Remove(adminItem1);
            menuItems.Remove(adminItem2);
        }

    }
    protected void NavigationMenu_MenuItemClick(object sender, MenuEventArgs e)
    {

    }
}
