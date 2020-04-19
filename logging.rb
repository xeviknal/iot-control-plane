class Logging
  class << self
    def info msg
      p "#{Time.now} [INFO] - #{msg}"
    end

    def error msg
      p "[ERROR] - #{msg}"
    end
  end
end
