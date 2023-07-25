class Scheduler

  attr_accessor :workers_with_trade
  WORKERS = [
    {
      email: 'bob@gmail',
      trades: ['cement'],
      cost: 80
    },
    {
      email: 'alice@gmail',
      trades: ['plumbing'],
      cost: 90
    },
    {
      email: 'Ted@gmail',
      trades: %w[cement bricklaying],
      cost: 75
    }
  ]

  #find workers who have the trade

  def workers_with_trade(trade)
    WORKERS.filter { |worker| worker[:trades].include?(trade) }
  end

  def get_emails(workers)
    workers.map { |worker| worker[:email] }
  end

  def get_cheapest_worker(workers)
    workers.min { |a,b| a[:cost] <=> b[:cost] }
  end

  def schedule_workers(trade)
    #takes trade and returns a array of SORTEd worker emails with the trade
    workers_for_trade = workers_with_trade(trade)
    worker_emails = get_emails(workers_for_trade)
    sort_emails(worker_emails)
  end

  def cheapest_workers_with_trade(trades)
    worker_emails = get_emails(trades.map { |trade| get_cheapest_worker(workers_with_trade(trade)) })
    sort_emails(worker_emails)
  end

  def sort_emails(emails)
    # emails.sort { |a,b| a.downcase <=> b.downcase }
    emails.sort_by(&:downcase)
  end

end

i = Scheduler.new

p i.schedule_workers('cement')
p i.cheapest_workers_with_trade(['cement', 'plumbing'])



