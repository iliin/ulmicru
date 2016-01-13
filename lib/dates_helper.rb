#FIXME it will fixed on https://trello.com/c/MqBhJhpc/407-configus-dates ticket
module DatesHelper
  CONFESSION_DATES = configus.dates.activity_lines.corporative.confession

  def submissions_petitions_during?
    submissions_petitions_begins? && !submissions_petitions_ends?
  end

  def submissions_petitions_begins?
    DateTime.now > CONFESSION_DATES.begining_submissions_petitions
  end

  def submissions_petitions_ends?
    DateTime.now > CONFESSION_DATES.ending_submissions_petitions
  end

  def voting_petitions_during?
    DateTime.now > CONFESSION_DATES.begining_voting &&
    DateTime.now < CONFESSION_DATES.ending_voting
  end

  def current_confession_year
    CONFESSION_DATES.begining_submissions_petitions.year
  end
end
