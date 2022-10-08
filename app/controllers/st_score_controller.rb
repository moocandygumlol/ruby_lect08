class StScoreController < ApplicationController
  def home
    @student = nil
    Student.all.each do |std|
      if std.id == params[:id].to_i
        @student = std
        break
      end
    end
  end

  def edit
    @id = params[:id]
    @sub = params[:data_sub]
    @point = params[:data_point]
    @grd = params[:data_grade]
  end

  def delete
    Score.destroy_by(id: params[:id])
    url = "/student/" + params[:stu_id] + "/edit_score"
    redirect_to url
  end

  def update
    @id = params[:id]
    @sc = Score.all.find(@id)
    @sc.subject = params[:subject]
    @sc.point = params[:point]
    @sc.grade = params[:grade]
    @sc.save
    @stu_id = @sc.student_id
    url = "/student/" + @stu_id.to_s + "/edit_score"
    redirect_to url
  end

  def add
  end

  def success
    @x = Score.new
    @x.subject = params[:subject]
    @x.point = params[:point].to_i
    @x.grade = params[:grade]
    @x.student_id = params[:id]
    @x.save
    url = "/student/" + params[:id] + "/edit_score"
    redirect_to url

  end

end
