module ExercisesHelper
  def sum
    current_user.exercises.sum(:duration)
  end

  def external_sum
    sum = 0
    @exer.each do |i|
      sum += i.duration
    end
    sum
  end

  def group_exercise
    group_show = ''

       @current_user.exercises.each do |e|
        group_show << "
    <div class=\"card mb-4 shadow\" style=\"max-width: 540px;\">
      <div class=\"row g-0\">
        <div class=\"col-md-3\">
           <img src=\"#{current_user.groups.first.display_image}\" >
        </div>
      <div class=\"col-md-9\">
      <div class=\"card-body\">
        <h5 class=\"card-title\">#{ e.name }</h5>
        <p class=\"card-text\"><small class=\"text-muted\"> #{e.duration} hour(s) </small></p>
        <p class=\"card-text\"><small class=\"text-muted\"> #{e.created_at.strftime("%d %b. %Y")}</small></p>
      </div>
    </div>
  </div>
  </div>"
    end
    group_show.html_safe
  end

  def show_exercise
    exercise_show = ''

       @current_user.exercises.each do |e|
        exercise_show << "
    <div class=\"card mb-4 shadow\" style=\"max-width: 540px;\">
      <div class=\"row g-0\">
        <div class=\"col-md-3\">
           <img src=\"assets/microverse.jpg\" >
        </div>
      <div class=\"col-md-9\">
      <div class=\"card-body\">
        <h5 class=\"card-title\">#{ e.name }</h5>
        <p class=\"card-text\"><small class=\"text-muted\"> #{e.duration} hour(s) </small></p>
        <p class=\"card-text\"><small class=\"text-muted\"> #{e.created_at.strftime("%d %b. %Y")}</small></p>
      </div>
    </div>
  </div>
  </div>"
    end
    exercise_show.html_safe
  end
end
