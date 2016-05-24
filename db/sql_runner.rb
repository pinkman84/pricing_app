class SqlRunner

  def self.run_sql( sql )
    begin
      db = PG.connect({ dbname: 'pricing_app', host: 'localhost' })
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end

end