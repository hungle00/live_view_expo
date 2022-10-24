defmodule LiveViewExpoWeb.CustomerLive do
  use LiveViewExpoWeb, :live_view

  alias LiveViewExpo.Company.Customer
  @sort_cols ~w(customer_name contact_first_name contact_last_name city country credit_limit)

  def mount(_params, _session, socket) do
    customers = Customer.list_customers()

    cols = [
      {"id","Id"}, {"customer_name","Customer"} , {"contact_first_name","First Name"} , {"contact_last_name","Last Name"}, {"phone" , "Phone"} ,
      {"address_line1", "Address Line 1"}, {"city","City"}, {"postal_code","Postal Code"} , {"country" , "Country"}, {"credit_limit", "Credit Limit"}
    ]

    {:ok, assign(socket, rows: customers, cols: cols, sort_cols: @sort_cols) }
  end

  @spec handle_params(any, any, any) :: nil | {:noreply, any}
  def handle_params(%{"sort_by" => sort_by}, _uri, socket) do
    case sort_by do
      sort_by when sort_by in @sort_cols ->
        {:noreply, assign(socket, rows: sort_customers(socket.assigns.rows, sort_by))}
      _ -> {:noreply, socket}
    end
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  def sort_customers(customers, "customer_name") do
    Enum.sort_by(customers, fn customer -> customer.customer_name end)
  end

  def sort_customers(customers, "credit_limit") do
    Enum.sort_by(customers, fn customer -> customer.credit_limit end)
  end
end
