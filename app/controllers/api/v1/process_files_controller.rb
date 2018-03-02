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
        # @debitos = ProcessFile.where(type_transaction: 2)
        # @creditos = ProcessFile.where(type_transaction: 4)
        # render template: 'api/v1/process_files/transactions', status: 200
        render json: {
          debitos: ProcessFile.where(type_transaction: 1),
          creditos: ProcessFile.where(type_transaction: 4)
        }
      end

      private

      def process_files_params
        params.permit(:transaction_type, :value, :cpf, :card)
      end
    end
  end
end
