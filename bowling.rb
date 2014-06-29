require 'mysql2'

class Bowling
  @var = 0

  def hit()
    con = Mysql2::Client.new(
      :host => ENV['RDS_HOSTNAME'],
      :username => ENV['RDS_USERNAME'],
      :password => ENV['RDS_PASSWORD'],
      :port => ENV['RDS_PORT'],
      :database => ENV['RDS_DB_NAME']
    )

    con.query("DROP TABLE IF EXISTS scores")
    con.query("CREATE TABLE scores(score INT)")
    con.query("INSERT INTO scores(score) VALUES(1234)")
    con.query("SELECT * FROM scores").each do |row|
      @var = row['score']
    end
  end

  def score
  	return @var
  end
end

