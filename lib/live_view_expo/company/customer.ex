defmodule LiveViewExpo.Company.Customer do
  use Ecto.Schema

  schema "customers" do
    field :customer_name, :string
    field :contact_last_name, :string
    field :contact_first_name, :string
    field :phone, :string
    field :address_line1, :string
    field :address_line2, :string
    field :city, :string
    field :state, :string
    field :postal_code, :string
    field :country, :string
    field :credit_limit, :decimal

  end
end
