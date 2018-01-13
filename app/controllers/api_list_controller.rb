class ApiListController < ApplicationController
  def getinfo

    logger.info(params[:list_url])

    list = List.new
    list.url = params[:list_url]
    logger.info(list)

    list = GitRepoService.new({list:list}).updateInfo

    logger.info(list)

    render json: list
  end
end
