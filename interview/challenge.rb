require 'area' # https://github.com/jgv/area
require 'uri'
require 'net/http'
require 'json'
# To complete this problem you will need these libraries. If you do not have them already downloaded on your computer please do so now.

# You are given a list of candidates & jobs.
# Your goal is to print out a map of jobs and all candidates that should be matched to that job.
# You may write just a single function or a class or with helper methods, etc. -- whatever you think will help you organize your code the best.
# Sort the candidates by the most recently registered first. 

# Job criteria
# Candidates must be located in the same city as the job location
# Candidates must have at least min years of experience but not more than max years of experience
# Candidates must be able to work in the category of the job
# Each Job can only support a maximum number of candidates. Once a job reaches its maximum number, it will not be matched to any more candidates. Break ties by sorting candidates who applied more recently first.

class JobMatcher 
  def initialize(jobs, candidates)
    @jobs = jobs
    @candidates = candidates
  end

  def match_jobs_with_candidates()
    job_with_matches = {}
  
    @jobs.each do |job|
      possible_candidates = get_possible_matches(job)
      ordered_candidates = possible_candidates.sort_by { |candidate| candidate[:date_registered] }.reverse
      first_possible_candidates = ordered_candidates.first(job[:maximum_number_of_matches])
  
      job_with_matches[job[:company]] = first_possible_candidates.map { |candidate| candidate[:name] }
    end
  
    job_with_matches
  end

  def send_message_to_slack(message)

    message.each_key do |job|
      uri = URI('https://hooks.slack.com/services/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')
      headers = { 'Content-Type': 'application/json' }

      names = message[job].join(' & ')
      message_parsed = "#{names} matched with #{job}"

      puts(message_parsed)
      body = { text: message_parsed }
  
      res = Net::HTTP.post(uri, body.to_json, headers)
    end
  end

  def get_possible_matches(job)
    possible_candidates = @candidates.select do |candidate|
      is_same_city = candidate[:zip_code].to_region == job[:location]
      is_possible_number_of_experience = candidate[:years_of_experience] >= job[:min_years_of_experience] && candidate[:years_of_experience] <= job[:max_years_of_experience]
      work_in_category = candidate[:categories].include?(job[:category])
  
      is_same_city && is_possible_number_of_experience && work_in_category
    end
  
    possible_candidates
  end 
end

jobs = [
  {
    company: 'Taco Bell',
    location: 'Los Angeles, CA',
    min_years_of_experience: 0,
    max_years_of_experience: 4,
    category: 'food',
    maximum_number_of_matches: 3
  },
  {
    company: 'Gap',
    location: 'Los Angeles, CA',
    min_years_of_experience: 1,
    max_years_of_experience: 5,
    category: 'retail',
    maximum_number_of_matches: 2
  },
  {
    company: 'Grocery King',
    location: 'San Francisco, CA',
    min_years_of_experience: 1,
    max_years_of_experience: 10,
    category: 'operations',
    maximum_number_of_matches: 2
  },
  {
    company: 'Gucci',
    location: 'San Francisco, CA',
    min_years_of_experience: 5,
    max_years_of_experience: 15,
    category: 'retail',
    maximum_number_of_matches: 1
  }
]
candidates = [
  {
    name: 'Bob Lee',
    zip_code: '94105',
    years_of_experience: 2,
    categories: ['retail', 'food'],
    date_registered: Date.new(2020,10,8)
  },
  {
    name: 'Mary Von',
    zip_code: '90001',
    years_of_experience: 6,
    categories: ['retail', 'operations'],
    date_registered: Date.new(2020,10,23)
  },
  {
    name: 'Claire White',
    zip_code: '90002',
    years_of_experience: 0,
    categories: ['food'],
    date_registered: Date.new(2020,10,3)
  },
  {
    name: 'Jason Kim',
    zip_code: '94107',
    years_of_experience: 2,
    categories: ['operations', 'food'],
    date_registered: Date.new(2020,10,4)
  },
  {
    name: 'David Johnson',
    zip_code: '90005',
    years_of_experience: 4,
    categories: ['retail'],
    date_registered: Date.new(2020,10,5)
  },
  {
    name: 'Liam Smith',
    zip_code: '94103',
    years_of_experience: 8,
    categories: ['retail'],
    date_registered: Date.new(2020,10,14)
  },
  {
    name: 'Rachel Zane',
    zip_code: '94107',
    years_of_experience: 11,
    categories: ['retail', 'operations'],
    date_registered: Date.new(2020,10,30)
  },
  {
    name: 'Michelle Thorpe',
    zip_code: '94105',
    years_of_experience: 1,
    categories: ['operations', 'food'],
    date_registered: Date.new(2020,10,11)
  },
  {
    name: 'Betty Martinez',
    zip_code: '94107',
    years_of_experience: 2,
    categories: ['operations'],
    date_registered: Date.new(2020,10,19)
  },
  {
    name: 'Annie Bold',
    zip_code: '90020',
    years_of_experience: 2,
    categories: ['operations', 'food'],
    date_registered: Date.new(2020,10,2)
  },
  {
    name: 'Randy John',
    zip_code: '94118',
    years_of_experience: 2,
    categories: ['operations', 'retail', 'food'],
    date_registered: Date.new(2020,10,1)
  }
]

match_maker = JobMatcher.new(jobs, candidates)
answer = match_maker.match_jobs_with_candidates()
match_maker.send_message_to_slack(answer)

puts answer


# Return:
expected = {"Taco Bell"=>["Claire White", "Annie Bold"], "Gap"=>["David Johnson"], "Grocery King"=>["Betty Martinez", "Michelle Thorpe"], "Gucci"=>["Rachel Zane"]}




# DO NOT READ UNTIL YOU ARE DONE WITH FIRST PART
# The second part of this exercise is to announce the matches you made on our slack channel using Slack's Incoming Webhooks functionality.
# We have already set up everything on Slack for you, all you need is our unique Slack URL below & you will be able to post to our Slack channel in less than 30 lines of code
# Slack URL: https://hooks.slack.com/services/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
# Post to Slack: "Claire White & Annie Bold matched with Taco Bell"
# Post to Slack: "David Johnson matched with Gap"
# Post to Slack: "Betty Martinez & Michelle Thorpe matched with Grocery King"
# Post to Slack: "Rachel Zane matched with Gucci"
