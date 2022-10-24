defmodule LiveViewExpo.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :customer_name, :string
      add :contact_last_name, :string
      add :contact_first_name, :string
      add :phone, :string
      add :address_line1, :string
      add :address_line2, :string
      add :city, :string
      add :state, :string
      add :postal_code, :string
      add :country, :string
      add :credit_limit, :decimal

    end
  end
end
