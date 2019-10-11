describe "Astronaut index page" do
  describe "as a vistior" do
    it "I can see a list of astronauts with name, age, and job" do

      @buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 89, job: 'Mission Commander' )

      visit '/astronauts'

      within "#astronaut-#{@buzz.id}" do
        expect(page).to have_content('Name: Buzz Aldrin')
        expect(page).to have_content('Age: 89')
        expect(page).to have_content('Job: Mission Commander')
      end

    end
  end
end