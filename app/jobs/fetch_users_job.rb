class FetchUsersJob < ApplicationJob
  queue_as :default

  def perform
    response = HTTParty.get('https://randomuser.me/api/?results=20')
    users = response.parsed_response['results']

    users.each do |user_data|
      uuid = user_data['login']['uuid']
      user = User.find_or_initialize_by(uuid: uuid)
      user.update(
        name: "#{user_data['name']['first']} #{user_data['name']['last']}",
        age: user_data['dob']['age'],
        gender: user_data['gender']
      )
    end

    male_count = User.where(gender: 'male').count
    female_count = User.where(gender: 'female').count

    $redis.set("male_count", male_count)
    $redis.set("female_count", female_count)
  end
end
