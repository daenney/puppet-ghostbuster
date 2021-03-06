require 'spec_helper'

describe 'ghostbuster_classes' do
  let(:path) { "./modules/foo/manifests/init.pp" }

  context 'with fix disabled' do

    context 'when class is used' do
      let(:code) { "class foo {}" }

      it 'should not detect any problem' do
        expect(problems).to have(0).problems
      end
    end

    context 'when class is not used' do
      let(:code) { "class bar {}" }

      it 'should detect one problem' do
        expect(problems).to have(1).problems
      end

      it 'should create a warning' do
        expect(problems).to contain_warning('Class Bar seems unused')
      end
    end
  end
end
