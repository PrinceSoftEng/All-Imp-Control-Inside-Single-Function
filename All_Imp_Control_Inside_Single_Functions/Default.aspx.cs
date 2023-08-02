using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace All_Imp_Control_Inside_Single_Functions
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindAll(ddlEmployee, "Select Id as value, FName as text from Employee");
            BindAll(chkEmployee, "Select Id as value, FName as text from Employee");
            BindAll(rblEmployee, "Select Id as value, FName as text from Employee");
            BindAll(gvEmployee, "Select Id,FName,MName,LName,EmailId from Employee");
            BindAll(rptEmployee, "Select Id,FName,MName,LName,EmailId from Employee");
        }

        public static void BindAll(object c, string sql)
        {
            string constring = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataSet ds = new DataSet())
                        {
                            sda.Fill(ds);
                            Control item = (Control) c;
                            if (item is DropDownList)
                            {
                                DropDownList ddlEmployee1 = (DropDownList)item;
                                ddlEmployee1.Items.Clear();
                                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                {
                                    ddlEmployee1.Items.Insert(i, new ListItem(ds.Tables[0].Rows[i]["text"].ToString(), ds.Tables[0].Rows[i]["value"].ToString()));
                                }
                                ddlEmployee1.Items.Insert(0, new ListItem("--Select Data--", "0"));
                            }
                            if (item is GridView)
                            {
                                ((GridView)item).DataSource = ds;
                                ((GridView)item).DataBind();
                            }
                            if (item is CheckBoxList)
                            {
                                CheckBoxList chklist= (CheckBoxList)item;
                                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                {
                                    chklist.Items.Insert(i, new ListItem(ds.Tables[0].Rows[i]["text"].ToString(), ds.Tables[0].Rows[i]["value"].ToString()));
                                }
                            }
                            if (item is RadioButtonList)
                            {
                                RadioButtonList rblemployee = (RadioButtonList)item;
                                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                {
                                    rblemployee.Items.Insert(i, new ListItem(ds.Tables[0].Rows[i]["text"].ToString(), ds.Tables[0].Rows[i]["value"].ToString()));
                                }
                            }
                            if (item is Repeater)
                            {
                                ((Repeater)item).DataSource = ds;
                                ((Repeater)item).DataBind();
                            }

                            if (item is DataList)
                            {
                                ((DataList)item).DataSource = ds;
                                ((DataList)item).DataBind();
                            }
                        }
                    }
                }
            }
        }
    }
}