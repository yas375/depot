class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create(:title => 'Pragmatic title',
                   :description =>
                           %{Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                             Morbi congue odio in elit aliquam tincidunt. Donec mattis urna at nunc adipiscing viverra. Maecenas dictum lacus vitae tellus auctor elementum. Aliquam libero libero, porttitor vitae iaculis sed, vehicula ac lorem. Sed sit amet sem eget leo aliquet scelerisque. Etiam tortor magna, rhoncus nec tincidunt luctus, interdum id sem. Suspendisse semper tellus ut lacus lacinia nec rutrum orci fringilla. Nulla sollicitudin congue molestie. Duis massa velit, vehicula eu aliquam ut, porta eget dui. Morbi vel arcu mauris, quis dapibus velit. Donec ullamcorper porta tellus, interdum tincidunt velit tempus at. Nullam in vestibulum dolor. Nunc ipsum orci, tincidunt vel pellentesque eu.
                             Interdum sit amet massa.
                    },
                   :image_url => '/images/asd.jpg',
                   :price => 23.46
    )
    Product.create(:title => 'Lorem Ipsum',
                   :description =>
                           %{Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                             Interdum sit amet massa.
                    },
                   :image_url => '/images/asdd.jpg',
                   :price => 21.46
    )
    Product.create(:title => 'Come as you are',
                   :description =>
                           %{Morbi congue odio in elit aliquam tincidunt. Donec mattis urna at nunc adipiscing viverra. Maecenas dictum lacus vitae tellus auctor elementum. Aliquam libero libero, porttitor vitae iaculis sed, vehicula ac lorem. Sed sit amet sem eget leo aliquet scelerisque. Etiam tortor magna, rhoncus nec tincidunt luctus, interdum id sem. Suspendisse semper tellus ut lacus lacinia nec rutrum orci fringilla. Nulla sollicitudin congue molestie. Duis massa velit, vehicula eu aliquam ut, porta eget dui. Morbi vel arcu mauris, quis dapibus velit. Donec ullamcorper porta tellus, interdum tincidunt velit tempus at. Nullam in vestibulum dolor. Nunc ipsum orci, tincidunt vel pellentesque eu,
                    },
                   :image_url => '/images/asddd.jpg',
                   :price => 11
    )
  end

  def self.down
    Product.delete_all
  end
end
