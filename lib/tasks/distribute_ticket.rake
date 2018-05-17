namespace :distribute_ticket do
# 例外が起こってもロールバックしないので、途中まで値が反映されてしまう
  desc "全ユーザーのticket_countを10増加させる"
  task execute: :environment do
    User.find_each do |user|
      user.increment!(:ticket_count, 10)
    end
  end

# トランザクションのおかげで、例外が起こった際に何も変更されない
  desc "全ユーザーのticket_countをトランザクションで10増加させる"
  task transact: :environment do
    ActiveRecord::Base.transaction do
      User.find_each do |user|
        user.increment!(:ticket_count, 10)
      end
    end
  end

# rescueしているため、例外が起こっても処理を続行する
  desc "全ユーザーのticket_countをrescueしながら10増加させる"
  task rescue: :environment do
    User.find_each do |user|
      begin
        user.increment!(:ticket_count, 10)
      rescue => e
        Rails.logger.debug e.message
      end
    end
  end
end
