defmodule Mix.Tasks.ImportData do
  use Mix.Task

  def run(path) do
    Mix.Task.run("app.start", [])

    opts = LiveViewExpo.Repo.config()
    {:ok, pid} = Postgrex.start_link(opts)

    Postgrex.transaction(
      pid,
      fn conn ->
        stream =
          Postgrex.stream(
            conn,
            "COPY customers(customer_name,contact_last_name,contact_first_name,phone,address_line1,address_line2,city,state,postal_code,country,credit_limit)
            FROM STDIN CSV HEADER DELIMITER ','",
            []
          )

        Enum.into(File.stream!(path, [:trim_bom]), stream)
      end,
      timeout: :infinity
    )
  end
end
