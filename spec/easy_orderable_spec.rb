require 'rails_helper.rb'

describe EasyOrderable do
  it { expect(described_class::VERSION).to eq('1.1.0') }

  describe '#assort' do
    let!(:user_a) { create(:user, name: 'A') }
    let!(:user_b) { create(:user, name: 'B') }
    let!(:user_c) { create(:user, name: 'C') }

    subject { relation.assort(param) }

    context 'table field' do
      let(:relation) { User.where(id: [user_a.id, user_b.id, user_c.id]) }

      context 'asc' do
        let(:param) { 'name' }

        it { is_expected.to eq([user_a, user_b, user_c]) }
      end

      context 'desc' do
        let(:param) { '-name' }

        it { is_expected.to eq([user_c, user_b, user_a]) }
      end
    end

    context 'joined table field' do
      let!(:booking_a) { create(:booking, user: user_a, slots_count: 10) }
      let!(:booking_b) { create(:booking, user: user_b, slots_count: 8) }
      let!(:booking_c) { create(:booking, user: user_c, slots_count: 8) }

      let(:relation) do
        Booking.where(id: [booking_a.id, booking_b.id, booking_c.id])
      end

      context 'asc' do
        let(:param) { 'user.name' }

        it { is_expected.to eq([booking_a, booking_b, booking_c]) }
      end

      context 'desc' do
        let(:param) { '-user.name' }

        it { is_expected.to eq([booking_c, booking_b, booking_a]) }
      end

      context 'multiple fields' do
        context 'asc' do
          let(:param) { 'slots_count,user.name' }

          it { is_expected.to eq([booking_b, booking_c, booking_a]) }
        end

        context 'asc and desc' do
          let(:param) { 'slots_count,-user.name' }

          it { is_expected.to eq([booking_c, booking_b, booking_a]) }
        end
      end
    end

    context 'joined field with custom association name' do
      let!(:request_a) { create(:request, renter: user_a) }
      let!(:request_b) { create(:request, renter: user_b) }
      let!(:request_c) { create(:request, renter: user_c) }

      let(:relation) do
        Request.where(id: [request_c.id, request_b.id, request_a.id])
      end

      subject { relation.assort(param, user: :renter) }

      context 'asc' do
        let(:param) { 'user.name' }

        it { is_expected.to eq([request_a, request_b, request_c]) }
      end

      context 'desc' do
        let(:param) { '-user.name' }

        it { is_expected.to eq([request_c, request_b, request_a]) }
      end
    end
  end
end
