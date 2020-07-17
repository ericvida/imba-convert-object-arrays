import {db} from './objects'

# class listObjectsOfArray
# 	prop counter = 1
# 	def constructor arr
# 		console.log "{counter++}. Class ListObjectsOfArray"
# 		getObjOfArray(arr)

# 	def getObjOfArray arr
# 		console.log "{counter++}. // getObjOfArray"
# 		for obj in arr
# 			console.log "object"
# 			console.log obj
# 			getPropOfObj(obj)
# 		else
# 			console.log "{counter++}. /// not an array"

# 	def getPropOfObj obj
# 		console.log "{counter++}. __ getPropOfObj"
# 		for own k,value of obj
# 			if value isa Array
# 				console.log "{counter++}. ___ value is array"
# 				getObjOfArray(obj)
# 			elif value isa Object
# 				console.log "{counter++}. ___ value is Object"
# 				getArrOfObject(obj)
# 			else
# 				value
			
# 	def getArrOfObject obj
# 		console.log "{counter++}. run getArrOfObject"
# 		for own k, value of obj
# 			if value isa Array
# 				console.log "{counter++}. getObjOfArray"
# 				getObjOfArray(value)
# 			else
# 				value

# let something = listObjectsOfArray.new db
let inputValue = "export const db"
tag js-imba
	def render
		<self>
			<pre>
				
				<div> "{inputValue} = ["
				for item,index in db
					if index isnt 0
						<div> "	---"
					<div> "	cham: \"{item.cham}\""
					<div> "	khmer: \"{item.khmer}\""
					<div> "	english: ["
						if item.english.length >= 1
							<div>
								for eng,i in item.english
									if i isnt 0
										<div> "		---"
									<div> "		meaning: \"{eng.meaning}\""
									<div> "		use: \"{eng.use}\""
									

						else
							<div> "		meaning: \"{item.english[0].meaning}\""
							<div> "		use: \"{item.english[0].use}\""
					<div> "	]"
				<div> "]"

tag imba-js
	prop inputValue = "let db"
	def render
		<self>
			<pre>
				<div> "{inputValue} = ["
				for item,index in db
					if index isnt 0
						<div> "	\},\{"
					if index is 0
						<div> "	\{"
					<div> "	cham: \"{item.cham}\""
					<div> "	khmer: \"{item.khmer}\""
					<div> "	english: [\{"
						if item.english.length >= 1
							<div>
								for eng,i in item.english
									if i isnt 0
										<div> "		\},\{"
									<div> "		meaning: \"{eng.meaning}\""
									<div> "		use: \"{eng.use}\""
									

						else
							<div> "		meaning: \"{item.english[0].meaning}\""
							<div> "		use: \"{item.english[0].use}\""
					<div> "		\}]"
					if index is (item.english.length - 1)
						<div> "	}"
				<div> "]"

tag app-root
	def render
		<self>
			<input[bg:gray7 c:white p:2 w:100%] bind=inputValue placeholder="{inputValue} ["> 
			<.converter[d:flex jc:center]>
				<imba-js[p:4 bg:gray1 flex:1]>
				<js-imba[p:4 bg:gray2 flex:1]>

imba.mount <app-root>