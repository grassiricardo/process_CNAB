module Api
  module V1
    class ProcessFilesController < ApplicationController
      before_action :authenticate_api_v1_user!, except: [:process_cnab]

      def process_cnab
        render json: { success: true, message: 'File successfully processed!' }, status: 200 if ProcessWorker.new.process_file
      end

      def transactions
        process_files = process_files_params.empty? ? ProcessFile.all : ProcessFile.where(process_files_params)
        render json: process_files
      end

      private

      def process_files_params
        params.permit(:type_transaction, :value, :cpf, :card)
      end
    end
  end
end
