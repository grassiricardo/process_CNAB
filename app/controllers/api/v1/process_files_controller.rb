module Api
  module V1
    class ProcessFilesController < ApplicationController
      before_action :authenticate_api_v1_user!, except: [:process_cnab]

      # GET /api/v1/process_cnab.json
      def process_cnab
        render json: { success: true, message: 'File successfully processed!' }, status: 200 if ProcessWorker.new.process_file
      end

      # GET /api/v1/transactions.json
      def transactions
        @transactions = process_files_params.empty? ? ProcessFile.all : ProcessFile.where(process_files_params)
        render json: @transactions
      end

      private

      def process_files_params
        params.permit(:type_transaction, :value, :cpf, :card)
      end
    end
  end
end
