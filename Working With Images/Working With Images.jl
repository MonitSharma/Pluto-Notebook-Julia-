### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ c0c1ade0-3ea0-11eb-2a21-cd94754f7237
using Images

# ╔═╡ e6d646fe-3ed9-11eb-0563-c3f9e67b250e
md"# Julia Programming Language"

# ╔═╡ 00e500de-3edb-11eb-0016-8bd6fd055ef5
md" ## Working With Images in Julia"

# ╔═╡ 3f6585b0-3edb-11eb-0a1c-6d4416ae8d16
md"## Module I: Images"

# ╔═╡ 93a6be40-3ea0-11eb-1dd7-37b7e688c897
begin
	url = "https://i.imgur.com/VGPeJ6s.jpg"
	download(url, "philip.jpg")
	philip = load("philip.jpg")
end

# ╔═╡ a61f19d0-3ede-11eb-105e-6f2f4c0d71ad
md" ##### If you have more than one line of code, write it in block enclosed in a begin .... end environment"

# ╔═╡ 11a03c30-3ea2-11eb-0cf6-39bf983a84cc
typeof(philip)

# ╔═╡ 4cd21e80-3edf-11eb-2de1-eb5c1df52d16
md" ##### typeof function shows us the RGB ratio of the image"

# ╔═╡ 931b0e20-3ea2-11eb-1805-b3d84df0735a
RGBX(0.5, 0.5,0.5)

# ╔═╡ 04d53af0-3ee8-11eb-2271-13aece61242c
md"#### Size tell us the size of the Matrix of the image"

# ╔═╡ bf943f7e-3ea2-11eb-19a7-93d084250735
size(philip)

# ╔═╡ 98d33620-3edf-11eb-32dd-b1eefa113e96
md" ### Downloading the image and saving it as Philip"

# ╔═╡ c78d91a0-3ea2-11eb-3577-353870e94420
philip  #image of a Corgi

# ╔═╡ 3d139380-3ee8-11eb-25e1-b3a92df07072
md" ##### Printing a specific pixel of the Given Image"

# ╔═╡ d01b3480-3ea2-11eb-07ab-61ce5e67e14a
philip[2356,1247]

# ╔═╡ 6623a940-3ee8-11eb-36d3-adefb9ef6548
md" #### Displaying the begin:end pixel"

# ╔═╡ e734e6c0-3ea2-11eb-337d-db5d2c53e452
 philip[1500:3500,500:2000]  #displaying a strip of the Image


# ╔═╡ 8ce932c0-3ee8-11eb-0665-63489ae6a8fa
md" #### Displaying the corgi"


# ╔═╡ 5d003c60-3ea3-11eb-1712-d973ad462c05
begin
	(h,w) = size(philip)  #stores the size of Matrix in (h,w)
	head = philip[(h÷2):h, (w÷10):(9w÷10)] #h ÷ 2 starts from half of the image to the 												last and w ÷ 10 start from the 1/10th of 												the width and goes to the 9/10th of the 												width
	
	## It's where the image is 
end

# ╔═╡ d5eaac50-3ea3-11eb-0f81-0fdabb34817b
÷ #we can type \div and then press Tab we get the "÷" symbol, works same as LATEX

# ╔═╡ 0fe9c7b0-3ea4-11eb-28c5-19d2f1f970ec
size(head) #gives  the size of the cropped image

# ╔═╡ 1d196e00-3ee9-11eb-3ba7-79e600cadf61
md" ### Concatenate the Images"

# ╔═╡ 1bfa4fc0-3ea4-11eb-3972-4967a911a36e
[head head]

# ╔═╡ 709977a0-3ee9-11eb-2a08-73ef05720126
md" #### Manipulating Matrices"

# ╔═╡ 41f8b8b0-3ea4-11eb-3ff4-8d28c9fd35dc
[
	head                            reverse(head, dims=2)
	reverse(head, dims=1)           reverse(reverse(head, dims=1), dims=2)
]

# ╔═╡ 8512b570-3ee9-11eb-1713-43b7c24f2725
md"#### Making a Copy of the Image"

# ╔═╡ 372e9de0-3ea5-11eb-0218-2b86b357cbac
new_phil= copy(head)

# ╔═╡ d8420700-3ee9-11eb-272a-9bb914764469
md" #### Displaying the RGB color pallete"


# ╔═╡ 9714d8c0-3ee9-11eb-0034-fd662b5f3972
blue = RGB(0,0,1)

# ╔═╡ b4e2b2f0-3ee9-11eb-34cd-bbfdc4fd4545
green = RGB(0,1,0)

# ╔═╡ 7b8cb360-3eea-11eb-278a-a5564661b519
md" #### for loop to print some part red"

# ╔═╡ 9ada0f02-3ea5-11eb-0b80-3535ffcf6cbe
red = RGB(1,0,0)

# ╔═╡ 5ebca780-3ea5-11eb-31e1-17942c771746
for i in 1:100
	for j in 1:300
		new_phil[i, j] = red
	end
end


# ╔═╡ ab53bd8e-3ea5-11eb-3afb-f9fdc15bdccc
new_phil

# ╔═╡ 075fd60e-3eeb-11eb-3137-3faf7e73b601
md" ### without for loop"

# ╔═╡ c4b93490-3ea5-11eb-3c74-b3b1e3aee0bb
begin
	new_phil2 = copy(new_phil)
	new_phil2[100:200, 1:100] .= RGB(1,1,0)
	new_phil2
end

# ╔═╡ 0f3880d0-3eeb-11eb-2bc6-9734981077ef
md"### Defining a function redify"

# ╔═╡ 17a22e50-3ea6-11eb-2956-27a0cebe3abb
function redify(color)
	return RGB(color.r, 0 ,0)
end

# ╔═╡ 6a9f7362-3ea6-11eb-2996-9b836cda5299
begin
	color = RGB(0.9, 0.7, 0.2)
	
	[color, redify(color)]
end

# ╔═╡ 96147b30-3ea6-11eb-22d7-0125cf3d86b4
redify.(philip)

# ╔═╡ 2914d580-3eeb-11eb-060a-47b1c43077b9
md" ####  A function Warm-light"

# ╔═╡ 447ff870-3ea7-11eb-0858-23cc0f6f4924
function warm_light(color, ratio=0.6)
	return RGB(color.r, color.g, color.b*ratio)
end

# ╔═╡ 5b295550-3eaa-11eb-3084-5d0d4161d369
warm_light.(philip, 0.2)

# ╔═╡ 0bd67aa2-3eaa-11eb-38b4-abeee6fef7ed


# ╔═╡ 664ac9d0-3ea7-11eb-0501-6dfd28548706


# ╔═╡ 664ee880-3ea7-11eb-27b7-d9f3fa30d18d


# ╔═╡ b62ce1a0-3ea6-11eb-2f95-f7c080f87713


# ╔═╡ 3a425440-3eaa-11eb-3916-fbb5425c551e


# ╔═╡ 63c08a90-3ea9-11eb-2c93-370709885948


# ╔═╡ 84d1cff2-3ea9-11eb-0e5e-1b7d69eea639


# ╔═╡ 8673f1c0-3eaa-11eb-0e00-4d04bf0c1c1b


# ╔═╡ daf93cf0-3ed7-11eb-0fe9-675ebcce4daf


# ╔═╡ Cell order:
# ╠═e6d646fe-3ed9-11eb-0563-c3f9e67b250e
# ╠═00e500de-3edb-11eb-0016-8bd6fd055ef5
# ╠═3f6585b0-3edb-11eb-0a1c-6d4416ae8d16
# ╠═c0c1ade0-3ea0-11eb-2a21-cd94754f7237
# ╠═93a6be40-3ea0-11eb-1dd7-37b7e688c897
# ╠═a61f19d0-3ede-11eb-105e-6f2f4c0d71ad
# ╠═11a03c30-3ea2-11eb-0cf6-39bf983a84cc
# ╠═4cd21e80-3edf-11eb-2de1-eb5c1df52d16
# ╠═931b0e20-3ea2-11eb-1805-b3d84df0735a
# ╠═04d53af0-3ee8-11eb-2271-13aece61242c
# ╠═bf943f7e-3ea2-11eb-19a7-93d084250735
# ╠═98d33620-3edf-11eb-32dd-b1eefa113e96
# ╠═c78d91a0-3ea2-11eb-3577-353870e94420
# ╠═3d139380-3ee8-11eb-25e1-b3a92df07072
# ╠═d01b3480-3ea2-11eb-07ab-61ce5e67e14a
# ╠═6623a940-3ee8-11eb-36d3-adefb9ef6548
# ╠═e734e6c0-3ea2-11eb-337d-db5d2c53e452
# ╠═8ce932c0-3ee8-11eb-0665-63489ae6a8fa
# ╠═5d003c60-3ea3-11eb-1712-d973ad462c05
# ╠═d5eaac50-3ea3-11eb-0f81-0fdabb34817b
# ╠═0fe9c7b0-3ea4-11eb-28c5-19d2f1f970ec
# ╠═1d196e00-3ee9-11eb-3ba7-79e600cadf61
# ╠═1bfa4fc0-3ea4-11eb-3972-4967a911a36e
# ╠═709977a0-3ee9-11eb-2a08-73ef05720126
# ╠═41f8b8b0-3ea4-11eb-3ff4-8d28c9fd35dc
# ╠═8512b570-3ee9-11eb-1713-43b7c24f2725
# ╠═372e9de0-3ea5-11eb-0218-2b86b357cbac
# ╠═d8420700-3ee9-11eb-272a-9bb914764469
# ╠═9714d8c0-3ee9-11eb-0034-fd662b5f3972
# ╠═b4e2b2f0-3ee9-11eb-34cd-bbfdc4fd4545
# ╠═7b8cb360-3eea-11eb-278a-a5564661b519
# ╠═5ebca780-3ea5-11eb-31e1-17942c771746
# ╠═9ada0f02-3ea5-11eb-0b80-3535ffcf6cbe
# ╠═ab53bd8e-3ea5-11eb-3afb-f9fdc15bdccc
# ╠═075fd60e-3eeb-11eb-3137-3faf7e73b601
# ╠═c4b93490-3ea5-11eb-3c74-b3b1e3aee0bb
# ╠═0f3880d0-3eeb-11eb-2bc6-9734981077ef
# ╠═17a22e50-3ea6-11eb-2956-27a0cebe3abb
# ╠═6a9f7362-3ea6-11eb-2996-9b836cda5299
# ╠═96147b30-3ea6-11eb-22d7-0125cf3d86b4
# ╠═2914d580-3eeb-11eb-060a-47b1c43077b9
# ╠═447ff870-3ea7-11eb-0858-23cc0f6f4924
# ╠═5b295550-3eaa-11eb-3084-5d0d4161d369
# ╠═0bd67aa2-3eaa-11eb-38b4-abeee6fef7ed
# ╠═664ac9d0-3ea7-11eb-0501-6dfd28548706
# ╠═664ee880-3ea7-11eb-27b7-d9f3fa30d18d
# ╠═b62ce1a0-3ea6-11eb-2f95-f7c080f87713
# ╠═3a425440-3eaa-11eb-3916-fbb5425c551e
# ╠═63c08a90-3ea9-11eb-2c93-370709885948
# ╠═84d1cff2-3ea9-11eb-0e5e-1b7d69eea639
# ╠═8673f1c0-3eaa-11eb-0e00-4d04bf0c1c1b
# ╠═daf93cf0-3ed7-11eb-0fe9-675ebcce4daf
