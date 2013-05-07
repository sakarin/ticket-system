Ransack.configure do |config|
  # See https://github.com/ernie/ransack/issues/34
  config.add_predicate 'date_equals',
                       :arel_predicate => 'eq',
                       #:formatter => proc {|v| v.to_date.to_s(:db) },
                       :formatter => proc {|v| v.to_date },
                       :validator => proc {|v| v.present?},
                       :compounds => true,
                       :type => :date
end